source discover.paths.sh
DAT="dat/$PROJECT.SR.dat"

SIZE=$(grep -v "^#" $DAT | cut -f 8 | awk '{s+=$1} END {print s / 1024 / 1024 / 1024 / 1024}')

echo Total required disk space $SIZE Tb
