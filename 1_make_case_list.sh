source discover.paths.sh

DAT="origdata/Batch1through6_sample_attributes.tsv"
OUT=$DISCOVER_CASES

# Mapping obtained from Mathangi email 8/9/18; see also dat/disease_mapping.dat
#     1  SUBJECT_ID
#     2  SAMPLE_ID
#     3  BODY_SITE
#     4  ANALYTE_TYPE
#     5  IS_TUMOR
#     6  PRIMARY_METASTATIC_TUMOR
#     7  HISTOLOGICAL_TYPE
#     8  PRIMARY_TUMOR_LOCATION
#     9  TUMOR_STAGE
#    10  TUMOR_GRADE
#    11  GENOTYPING_CENTER
#    12  SEQUENCING_CENTER

awk 'BEGIN{FS="\t";OFS="\t"}{print $1, $3}' $DAT | grep -v SUBJECT_ID | sort -u > $OUT

echo Written to $OUT
