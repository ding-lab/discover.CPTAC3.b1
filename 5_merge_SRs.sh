source CPTAC3.b2.paths.sh

OUT="dat/$PROJECT.SR.dat"
rm -f $OUT

function process_case {
DAT=$1
DIS=$2

while read CASE; do

[[ $CASE = \#* ]] && continue  # Skip commented out entries

>&2 echo Processing $CASE

bash "$CASEDISCOVER_HOME/merge_submitted_reads.sh" $CASE $DIS  >> $OUT

done < $DAT
}

process_case "dat/UCEC_Cases.dat" UCEC 
process_case "dat/CCRC_Cases.dat" CCRC 

echo Written to $OUT

