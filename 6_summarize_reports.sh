source discover.paths.sh

SR="dat/${PROJECT}.SR.dat"  # this is the one with hg38 and sub (unknown submitted reference) combined
OUT_SR="dat/${PROJECT}.file-summary.txt"
rm -f $OUT_SR
bash CPTAC3.case.discover/summarize_cases.sh $DISCOVER_CASES $SR $OUT_SR
echo Written to $OUT_SR

