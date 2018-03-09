source discover.paths.sh

CASES="dat/$PROJECT.cases.dat"
OUT="dat/$PROJECT.Demographics.dat"
bash "$CASEDISCOVER_HOME/get_demographics.sh" $CASES > $OUT
echo Written to $OUT


