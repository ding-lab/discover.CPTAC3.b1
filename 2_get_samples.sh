source CPTAC3.b2.paths.sh

SRC="queryGDC/case.discover"

function process_case {
DAT=$1

while read CASE; do

[[ $CASE = \#* ]] && continue  # Skip commented out entries
>&2 echo Processing $CASE

bash "$QUERYGDC_HOME/case.discover/get_sample.sh" $CASE 

done < $DAT
}

process_case "dat/UCEC_Cases.dat"
process_case "dat/CCRC_Cases.dat"

