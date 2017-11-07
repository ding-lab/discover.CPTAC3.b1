TOKEN="config/gdc-user-token.2017-11-04T01-21-42.215Z.txt"
SRC="/Users/mwyczalk/src/queryGDC/case.discover"

function process_case {
DAT=$1

while read CASE; do

[[ $CASE = \#* ]] && continue  # Skip commented out entries

>&2 echo Processing $CASE

bash $SRC/get_submitted_reads.sh $CASE $TOKEN

done < $DAT
}

process_case "dat/UCEC_Cases.dat"
process_case "dat/CCRC_Cases.dat"

