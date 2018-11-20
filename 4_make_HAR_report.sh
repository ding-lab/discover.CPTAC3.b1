source discover.paths.sh

SR="dat/$PROJECT.SR-hg19.dat"
HAR="dat/$PROJECT.HAR-hg38.dat"

bash CPTAC3.case.discover/get_harmonized_reads.sh $SR $HAR
