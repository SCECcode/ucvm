#!/usr/bin/env bash
# suggested by chatgpt
# ucvm_query_diff.sh fileA fileB

file1="$1"
file2="$2"
tol=0.001   # change tolerance here

awk -v tol="$tol" '
NR==FNR {
    lines1[NR]=$0
    next
}
{
    if (!(FNR in lines1)) {
        print "Line count differs"
        exit 1
    }

    n1 = split(lines1[FNR], a)
    n2 = split($0, b)

    if (n1 != n2) {
        printf("Line %d: different number of columns\n", FNR)
        next
    }

    for (i=1; i<=n1; i++) {
        if (a[i] == b[i]) continue

        # check if both are numeric
        if (a[i] ~ /^-?[0-9.]+$/ && b[i] ~ /^-?[0-9.]+$/) {
            diff = a[i] - b[i]
            if (diff < 0) diff = -diff
            if (diff > tol) {
                printf("Line %d, Col %d: %s != %s\n", FNR, i, a[i], b[i])
            }
        } else {
            printf("Line %d, Col %d: %s != %s\n", FNR, i, a[i], b[i])
        }
    }
}
END {
    if (NR != length(lines1)) {
        print "Line count differs"
    }
}
' "$file1" "$file2"
