source discover.paths.sh

OUT="dat/$PROJECT.SR-sub.dat"

bash CPTAC3.case.discover/merge_submitted_reads.sh $DISCOVER_CASES $OUT

echo Written to $OUT

