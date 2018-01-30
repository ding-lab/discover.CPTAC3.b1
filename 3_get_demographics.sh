source discover.paths.sh

CASES="dat/all_cases.dat"
OUT="dat/$PROJECT.Demographics.dat"
bash "$CASEDISCOVER_HOME/get_demographics.sh" $CASES > $OUT
echo Written to $OUT


