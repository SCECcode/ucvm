#!/usr/bin/env python3
##########################################################
#
# Script: int2float.py
#
# Description: Convert i2 format GIS grid files into float
#
##########################################################


# Basic modules
import os
import sys
import struct
from ParseHeader import *



class int2float:
    def __init__(self, hdr, infile, outfile):
        self.valid = False
        self.hdr = hdr
        self.infile = infile
        self.outfile = outfile
        self.valid = True


    def isValid(self):
        return self.valid


    def cleanup(self):
        return

    def _parseHdr(self):
        fp = open(self.hdr, 'r')
        data = fp.readlines()
        fp.close()

        p = ParseConfig(data)
        p.showDict()
        config = p.getDict()
 
        self.ncols = int(config['ncols'])
        self.nrows = int(config['nrows'])

        return(0)

    def main(self):

        # Parse header
        print("Parsing data header")
        self._parseHdr()

        ifp = open(self.infile, 'rb')
        ofp = open(self.outfile, 'wb')

        for j in xrange(0, self.nrows):
            for i in xrange(0, self.ncols):
                buf = ifp.read(2)
                val = float(struct.unpack('h', buf)[0])
                buf = struct.pack('f', val)
                ofp.write(buf)

        ifp.close()
        ofp.close()
        return 0


def usage():
    print("usage: %s <hdr> <infile> <outfile>" % (sys.argv[0]))
    return


if __name__ == '__main__':
    if (len(sys.argv) != 4):
        usage()
        sys.exit(1)

    hdr = sys.argv[1]
    infile = sys.argv[2]
    outfile = sys.argv[3]

    prog = int2float(hdr, infile, outfile)
    sys.exit(prog.main())
