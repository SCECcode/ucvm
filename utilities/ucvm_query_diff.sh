#!/usr/bin/env bash
# chatgpt
# compare.sh file1 file2 [tol] [--quiet] [--case-insensitive-text]
#   tol default = 0.001
#   Exit codes: 0 = match, 1 = differ, 2 = usage/error

file1="$1"
file2="$2"
tol="${3:-0.01}"
quiet=1
case_insensitive=0

if [ -z "$file1" ] || [ -z "$file2" ]; then
  echo "Usage: $0 file1 file2 [tolerance] [--quiet] [--case-insensitive-text]" >&2
  exit 2
fi

for arg in "$@"; do
  [ "$arg" = "--quiet" ] && quiet=0
  [ "$arg" = "--case-insensitive-text" ] && case_insensitive=1
done

# Call awk with the program supplied via a here-doc to avoid quoting issues
awk -v tol="$tol" -v quiet="$quiet" -v ci="$case_insensitive" -f - "$file1" "$file2" <<'AWK'
BEGIN {
  # number regex: optional sign, digits with optional decimal, or .digits, optional exponent
  num_re = "^[+-]?([0-9]+\\.?[0-9]*|\\.[0-9]+)([eE][+-]?[0-9]+)?$"
  diffs = 0
  exit_code = 0
}
# read first file
FNR==NR {
  sub(/\r$/, "", $0)            # strip CRLF if any
  lines1[FNR] = $0
  nlines1 = FNR
  next
}
# process second file
{
  sub(/\r$/, "", $0)
  lineno = FNR

  # If one file has a header line that is non-numeric and both are identical, skip it
  split(lines1[lineno], t1)
  split($0, t2)
  first1 = (length(t1) >= 1 ? t1[1] : "")
  first2 = (length(t2) >= 1 ? t2[1] : "")
  if (first1 !~ num_re && first2 !~ num_re && lines1[lineno] == $0) {
    next
  }

  if (!(lineno in lines1)) {
    if (!quiet) printf("Line count differs: file1 has %d lines, file2 has >= %d lines\n", nlines1, lineno)
    diffs++; exit_code=1
  }

  n1 = split(lines1[lineno], a)
  n2 = split($0, b)

  if (n1 != n2) {
    if (!quiet) printf("Line %d: different number of columns (%d vs %d)\n", lineno, n1, n2)
    diffs++; exit_code=1
  }

  m = (n1 < n2 ? n1 : n2)
  for (i = 1; i <= m; ++i) {
    ai = a[i]; bi = b[i]

    # fast exact match
    if (ai == bi) continue

    # numeric compare when both tokens look like numbers
    if (ai ~ num_re && bi ~ num_re) {
      nai = ai + 0
      nbi = bi + 0
      diff = nai - nbi
      if (diff < 0) diff = -diff
      if (!(diff <= tol)) {
        if (!quiet) printf("Line %d, Col %d: %s != %s (abs diff = %g > tol %g)\n", lineno, i, ai, bi, diff, tol)
        diffs++; exit_code=1
      }
    } else {
      ta = ai; tb = bi
      if (ci) {
        ta = tolower(ai)
        tb = tolower(bi)
      }
      if (ta != tb) {
        if (!quiet) printf("Line %d, Col %d: '%s' != '%s'\n", lineno, i, ai, bi)
        diffs++; exit_code=1
      }
    }
  }
}
END {
  if (NR < nlines1) {
    if (!quiet) printf("Line count differs: file1 has %d lines, file2 has %d lines\n", nlines1, NR)
    diffs++; exit_code=1
  }

  if (diffs == 0) {
    if (!quiet) print "Files match within tolerance."
    exit(0)
  } else {
    if (!quiet) printf("Total differences: %d\n", diffs)
    exit(1)
  }
}
AWK

rc=$?
if [ $rc -eq 0 ]; then
  exit 0
else
  exit 1
fi

