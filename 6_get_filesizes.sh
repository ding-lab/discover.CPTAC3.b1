DAT="dat/CPTAC3.b3.SR.dat"

SIZE=$(grep -v "^#" $DAT | cut -f 8 | awk '{s+=$1} END {print s / 1024 / 1024 / 1024 / 1024}')

echo Total required disk space $SIZE Tb
