source discover.paths.sh

# Sample types:
# Primary Tumor = T
# Blood Derived Normal = B
# Solid Tissue Normal = S

DAT="dat/CPTAC3.b3.cases.dat"
OUT="dat/$PROJECT.file-summary.dat"
rm -f $OUT
bash $CASEDISCOVER_HOME/summarize_cases.sh $DAT $OUT

echo Written to $OUT

