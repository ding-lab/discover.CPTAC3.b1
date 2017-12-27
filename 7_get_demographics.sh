source CPTAC3.b2.paths.sh

# TODO: recover /Users/mwyczalk/src/queryGDC/case.discover/get_demographics.sh

CASES="dat/UCEC_Cases.dat"
OUT="dat/$PROJECT.UCEC.Demographics.dat"
bash "$QUERYGDC_HOME/case.discover/get_demographics.sh" $CASES $TOKEN > $OUT
echo Written to $OUT

CASES="dat/CCRC_Cases.dat"
OUT="dat/$PROJECT.CCRC.Demographics.dat"
bash "$QUERYGDC_HOME/case.discover/get_demographics.sh" $CASES $TOKEN > $OUT
echo Written to $OUT

