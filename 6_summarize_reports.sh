source discover.paths.sh

CASES="dat/$PROJECT.cases.dat"

SR="dat/${PROJECT}.SR.dat"  # this is the one with hg38 and hg19 combined
OUT_SR="dat/${PROJECT}.file-summary.txt"
rm -f $OUT_SR
bash CPTAC3.case.discover/summarize_cases.sh $CASES $SR $OUT_SR
echo Written to $OUT_SR

