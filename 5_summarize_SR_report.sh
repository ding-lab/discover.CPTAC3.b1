source discover.paths.sh

OUT="dat/$PROJECT.file-summary.dat"
rm -f $OUT
bash $CASEDISCOVER_HOME/summarize_cases.sh dat/all_cases.dat $OUT

echo Written to $OUT

