TOKEN="token/gdc-user-token.2017-12-19T21_33_26.306Z.txt"
SRC="/Users/mwyczalk/src/queryGDC/case.discover"


CASES="dat/UCEC_Cases.dat"
OUT="dat/UCEC_Demographics.dat"
bash $SRC/get_demographics.sh $CASES $TOKEN > $OUT
echo Written to $OUT

CASES="dat/CCRC_Cases.dat"
OUT="dat/CCRC_Demographics.dat"
bash $SRC/get_demographics.sh $CASES $TOKEN > $OUT
echo Written to $OUT

