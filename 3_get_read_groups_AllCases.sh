source discover.paths.sh

function process_case {
DAT=$1

while read CASE; do

[[ $CASE = \#* ]] && continue  # Skip commented out entries
>&2 echo Processing $CASE

bash "$CASEDISCOVER_HOME/get_read_groups.sh" $CASE 

done < $DAT
}

process_case "dat/UCEC_Cases.dat"
process_case "dat/CCRC_Cases.dat"

