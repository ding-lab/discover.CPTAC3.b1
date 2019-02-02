source discover.paths.sh

SR="dat/$PROJECT.SR-sub"
HAR="dat/$PROJECT.HAR-hg38.dat"

bash CPTAC3.case.discover/get_harmonized_reads.sh $SR $HAR
