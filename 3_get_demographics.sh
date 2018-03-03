source discover.paths.sh

CASES="dat/CPTAC3.b1-2.cases.dat"
OUT="dat/$PROJECT.Demographics.dat"
bash "$CASEDISCOVER_HOME/get_demographics.sh" $CASES > $OUT
echo Written to $OUT


