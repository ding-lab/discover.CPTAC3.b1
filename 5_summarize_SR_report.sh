source discover.paths.sh

DAT="dat/CPTAC3.b1-2.cases.dat"
OUT="dat/$PROJECT.file-summary.dat"
rm -f $OUT
bash $CASEDISCOVER_HOME/summarize_cases.sh $DAT $OUT

echo Written to $OUT

