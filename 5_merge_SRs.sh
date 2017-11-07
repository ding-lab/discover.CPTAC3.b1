OUT="dat/SR_merged.dat"
rm -f $OUT

SRC="/Users/mwyczalk/src/queryGDC/case.discover"

function process_case {
DAT=$1
DIS=$2

while read CASE; do

[[ $CASE = \#* ]] && continue  # Skip commented out entries

>&2 echo Processing $CASE

bash $SRC/merge_submitted_reads.sh $CASE $DIS  >> $OUT

done < $DAT
}

process_case "dat/UCEC_Cases.dat" UCEC 
process_case "dat/CCRC_Cases.dat" CCRC 

echo Written to $OUT

