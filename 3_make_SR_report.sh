source discover.paths.sh

DAT="dat/$PROJECT.cases.dat"
OUT="dat/$PROJECT.SR.dat"

bash CPTAC3.case.discover/merge_submitted_reads.sh $DAT $OUT

echo Written to $OUT

