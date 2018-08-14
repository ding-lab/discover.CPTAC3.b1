source discover.paths.sh

OUT="dat/$PROJECT.Demographics.dat"
bash "CPTAC3.case.discover/get_demographics.sh" $DISCOVER_CASES > $OUT
echo Written to $OUT


