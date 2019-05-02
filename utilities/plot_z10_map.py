#!/usr/bin/env python

##
#  @file plot_z10_slice.py
#  @brief Plots a Z1.0 slice using command-line parameters.
#  @author David Gill - SCEC <davidgil@usc.edu>
#  @version 14.7.0
#
#  Plots a Vs30 slice given a set of command-line parameters.

from pycvm import Z10Slice, UCVM, VERSION, UCVM_CVMS, Point
import getopt, sys, os

## Prints usage of this utility.
def usage():
    print "Generates a Z1.0 map or text file given two bounding latitude and longitude "
    print "co-ordinates, the CVM to plot, and a couple of other settings."
    print "\nValid arguments:"
    print "\t-b, --bottomleft: bottom-left latitude, longitude (e.g. 34,-118)"
    print "\t-u, --upperright: upper-right latitude, longitude (e.g. 35,-117)"
    print "\t-s, --spacing: grid spacing in degrees (typically 0.01)"
    print "\t-z, --interval: Z-interval, in meters, for Z%.1f to be queried (lower value means more precision)"
    print "\t-c, --cvm: one of the installed CVMs"
    print "\t-a, --scale: color scale, either 's' for smooth or 'd' for discretized, without quotes"
    print "\t-f, --datafile: optional binary input data filename"
    print "\t-x, --x: optional x steps matching the datafile"
    print "\t-y, --y: optional y steps matching the datafile"
    print "\t-o, --outfile: optional png output filename"
    print "\t-e, --extra: optional extra note to be appended to the plot title"
    print "\t-H, --help: display usage information"
    print "\t-i, --installdir: optional UCVM install directory"
    print "UCVM %s\n" % VERSION


## Makes sure the response is a number.
def ask_number(question):
    temp_val = None
    
    while temp_val is None:
        temp_val = raw_input(question)
        try:
            float(temp_val)
            return float(temp_val)
        except ValueError:
            print temp_val + " is not a number. Please enter a number."
            temp_val = None
    
## Gets the options and assigns them to the correct variables.
def get_user_opts(options):
    
    short_opt_string = ""
    long_opts = []
    opts_left = []
    opts_opt = []
    ret_val = {}
    
    for key, value in options.iteritems():
        short_opt_string = short_opt_string + key.split(",")[0]
        if value != "":
           short_opt_string = short_opt_string + ":"
        long_opts.append(key.split(",")[1])
        opts_left.append(key.split(",")[0])

    try:
        opts, args = getopt.getopt(sys.argv[1:], short_opt_string, long_opts)
    except getopt.GetoptError as err:
        print str(err)   
        exit(1)

    if len(opts) == 0 :
        return {}
    
    for o, a in opts:
        for key, value in options.iteritems():
            if value == "": ##help case
                continue
            if o == "-" + key.split(",")[0] or o == "--" + key.split(",")[1]:
                opts_left.remove(key.split(",")[0])
                if "," in value:
                    ret_val[value.split(",")[0]] = a.split(",")[0]
                    ret_val[value.split(",")[1]] = a.split(",")[1]
                else:
                    ret_val[value] = a

# handle optional opts
    for l in opts_left :
        if l == "H" :
            usage()
            exit(0) 
        elif l == "f" :
            opts_opt.append(l)
            ret_val["datafile"] = None
        elif l == "o" :
            opts_opt.append(l)
            ret_val["outfile"] = None
        elif l == "e" :
            opts_opt.append(l)
            ret_val["extra"] = None
        elif l == "x" :
            opts_opt.append(l)
            ret_val["nx"] = None
        elif l == "y" :
            opts_opt.append(l)
            ret_val["ny"] = None
        elif l == "i" :
            opts_opt.append(l)
            ret_val["installdir"] = None

    if len(opts_left) == 0 or len(opts_left) == len(opts_opt):
        return ret_val
    else:
        return "bad"

meta = {}

ret_val = get_user_opts({"b,bottomleft":"lat1,lon1", \
                         "u,upperright":"lat2,lon2", \
                         "s,spacing":"spacing", \
                         "c,cvm":"cvm_selected", \
                         "f,datafile":"datafile", \
                         "o,outfile":"outfile", \
                         "x,nx":"nx", \
                         "y,ny":"ny", \
                         "a,scale": "color", \
                         "e,extra":"extra", \
                         "H,help":"", \
                         "i,installdir":"installdir" })

if ret_val == "bad":
    usage()
    exit(1)
elif len(ret_val) > 0:
    print "Using parameters:\n"
    for key, value in ret_val.iteritems():
        print key , " = " , value
        meta[key]=value
        try:
            float(value)
            exec("%s = float(%s)" % (key, value))
        except StandardError, e:
            if value is None:
                exec("%s = %s" % (key, value))
            else:
                exec("%s = '%s'" % (key, value))
    useMPI = "n"
else:      
    print ""
    print "Z1.0  - UCVM %s" % (VERSION)
    print ""
    print "This utility helps you either plot a Z1.0 basin depth map or save the data in a"
    print "text file that you can then later parse."
    print ""
    print "In order to create the plot, you must first specify the region."
    print ""

    installdir = None

    lon1 = ask_number("Please enter the bottom-left longitude from which the Z1.0 values should come: ")
    lat1 = ask_number("Next, enter the bottom-left latitude from which the Z1.0 values should come: ")
    lon2 = ask_number("Enter the top-right longitude where the Z1.0 values should end: ")
    lat2 = ask_number("Enter the top-right latitude where the Z1.0 values should end: ")

    # Check to see that this is a valid box.
    if lon1 > lon2 or lat1 > lat2:
        print "Error: (%.2f, %.2f) to (%.2f, %.2f) is not a valid box. Please re-run this script" % (lon1, lat1, lon2, lat2)
        print "and specify a valid region. The first point should be the lower-left corner, the"
        print "second point should be the upper-right corner."
        exit(1)
    
    spacing = -1

    while spacing <= 0:
        spacing = ask_number("Which grid spacing (in decimal degree units) would you like (usually, this is 0.01): ")
    
        if spacing <= 0:
            print "Error: grid spacing must be a positive number."
        
    print ""

    # Ask which CVMs to use.
    print "From which CVM would you like this data to come:"

    counter = 1
    corresponding_cvm = []

    # Create a new UCVM object.
    u = UCVM(install_dir=installdir)

    for cvm in u.models:
        cvmtoprint = cvm
        if cvm in UCVM_CVMS:
            cvmtoprint = UCVM_CVMS[cvm]
        corresponding_cvm.append(cvm)
        print "\t%d) %s" % (counter, cvmtoprint)
        counter += 1
    
        cvm_selected = -1

    while cvm_selected < 0 or cvm_selected > counter:
        cvm_selected = int(ask_number("\nSelect the CVM: ")) - 1
    
        if cvm_selected < 0 or cvm_selected > counter:
            print "Error: the number you selected must be between 1 and %d" % counter

    cvm_selected = corresponding_cvm[cvm_selected]

    color = ""

    while color != "s" and color != "d" and data_type != "poisson":
        print ""
        color = raw_input("Finally, would you like a descritized or smooth color scale\n(enter 'd' for discrete, 's' for smooth): ")
        color = color.strip()

        if color != "s" and color != "d":
            print "Please enter 'd' (without quotation marks) for a discrete color bar and 's' (without quotation"
            print "marks) for a smooth color scale."

# Generate the horizontal slice.
b = Z10Slice(Point(lon1, lat2, 0), Point(lon2, lat1, 0), spacing, cvm_selected, xsteps=nx, ysteps=ny)
b.plot(datafile=datafile,filename=outfile, color_scale=color, note=extra, meta=meta)
