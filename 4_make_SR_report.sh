source discover.paths.sh

DAT="dat/all_cases.dat"
OUT="dat/$PROJECT.SR.dat"

bash $CASEDISCOVER_HOME/merge_submitted_reads.sh $DAT $OUT

echo Written to $OUT

