source discover.paths.sh

CASES="dat/$PROJECT.cases.dat"

# Look at both SR and HAR files
SR="dat/${PROJECT}.SR.dat"
OUT="dat/${PROJECT}.SR.file-summary.txt"
rm -f $OUT
bash CPTAC3.case.discover/summarize_cases.sh $CASES $SR $OUT
echo Written to $OUT

HAR="dat/${PROJECT}.HAR.dat"
OUT="dat/${PROJECT}.HAR.file-summary.txt"
rm -f $OUT
bash CPTAC3.case.discover/summarize_cases.sh $CASES $HAR $OUT

echo Written to $OUT

