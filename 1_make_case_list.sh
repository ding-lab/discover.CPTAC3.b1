source discover.paths.sh

DAT="dat/CPTAC-3_AlignedReads_GDC-Manifest.txt"
OUT=$DISCOVER_CASES

# Mapping obtained from Mathangi email 8/9/18; see also dat/disease_mapping.dat

awk 'BEGIN{FS="\t";OFS="\t"}{print $7, $6}' $DAT | grep -v primary_diagnosis | \
sed 's/Acute myeloid leukemia, NOS/AML/' | \
sed 's/Renal cell carcinoma, NOS/CCRCC/' | \
sed 's/Malignant melanoma, NOS/CM/' | \
sed 's/Glioblastoma/GBM/' | \
sed 's/Squamous cell carcinoma, NOS/LSCC/' | \
sed 's/Adenocarcinoma, NOS/LUAD/' | \
sed 's/Infiltrating duct carcinoma, NOS/PDA/' | \
sed 's/Sarcoma, NOS/SAR/' | \
sed 's/Endometrioid adenocarcinoma, NOS/UCEC/' | \
sed 's/---/NA/' | sort -u > $OUT

echo Written to $OUT
