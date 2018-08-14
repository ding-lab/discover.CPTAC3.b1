source discover.paths.sh

# Usage: get_size_by_type TYPE
# where TYPE is WGS, WXS, RNA-Seq
function get_size_by_type {
	grep -v "^#" $DAT | awk -v t=$1 '{if ($4 == t) print}' | cut -f 8 | awk '{s+=$1} END {print s / 1024 / 1024 / 1024 / 1024}'
	#SIZE=$(grep -v "^#" $DAT | cut -f 8 | awk '{s+=$1} END {print s / 1024 / 1024 / 1024 / 1024}')
}

function summarize {
DAT=$1
WGS_SIZE=$(get_size_by_type WGS)
WXS_SIZE=$(get_size_by_type WXS)
RNA_SIZE=$(get_size_by_type RNA-Seq)

echo $DAT
echo "Total required disk space WGS: $WGS_SIZE Tb"
echo "                          WXS: $WXS_SIZE Tb"
echo "                          RNA-Seq: $RNA_SIZE Tb"
}

summarize "dat/${PROJECT}.SR.dat"
summarize "dat/${PROJECT}.HAR.dat"
