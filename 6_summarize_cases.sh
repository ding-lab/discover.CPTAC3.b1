DAT="dat/SR_merged.dat"
OUT="dat/SR_summary.dat"
rm -f $OUT

# Usage: repN X N
# will return a string consisting of character X repeated N times
# if N is 0 empty string is returned
# https://stackoverflow.com/questions/5349718/how-can-i-repeat-a-character-in-bash
function repN {
X=$1
N=$2

if [ $N == 0 ]; then
return
fi

printf "$1"'%.s' $(eval "echo {1.."$(($2))"}");

}

function summarize_case {
CASE=$1
DIS=$2

# Get counts for (tumor, normal) x (WGS, WXS, RNA-Seq)
#  "$CASE\t$DISEASE\t$ES\t$SAMP_TYPE\t$SAMPS\t$FN\t$FS\t$ID\t$MD\n"

#Primary Tumor
#Blood Derived Normal

TT="Primary Tumor"
ES="WGS"

# Get number of matches for each data category
WGS_T=$(awk -v c=$CASE 'BEGIN{FS="\t";OFS="\t"}{if ( ($1 == c) && ($3 == "WGS") && ($4 == "Primary Tumor")) print}' $DAT | wc -l)
WGS_N=$(awk -v c=$CASE 'BEGIN{FS="\t";OFS="\t"}{if ( ($1 == c) && ($3 == "WGS") && ($4 == "Blood Derived Normal")) print}' $DAT | wc -l)

WXS_T=$(awk -v c=$CASE 'BEGIN{FS="\t";OFS="\t"}{if ( ($1 == c) && ($3 == "WXS") && ($4 == "Primary Tumor")) print}' $DAT | wc -l)
WXS_N=$(awk -v c=$CASE 'BEGIN{FS="\t";OFS="\t"}{if ( ($1 == c) && ($3 == "WXS") && ($4 == "Blood Derived Normal")) print}' $DAT | wc -l)

RNA_T=$(awk -v c=$CASE 'BEGIN{FS="\t";OFS="\t"}{if ( ($1 == c) && ($3 == "RNA-Seq") && ($4 == "Primary Tumor")) print}' $DAT | wc -l)
RNA_N=$(awk -v c=$CASE 'BEGIN{FS="\t";OFS="\t"}{if ( ($1 == c) && ($3 == "RNA-Seq") && ($4 == "Blood Derived Normal")) print}' $DAT | wc -l)

# Get string represnetations, given character repeated as many times as datasets 
WGS_TS=$(repN T $WGS_T)
WGS_NS=$(repN N $WGS_N)
WXS_TS=$(repN T $WXS_T)
WXS_NS=$(repN N $WXS_N)
RNA_TS=$(repN T $RNA_T)
RNA_NS=$(repN N $RNA_N)

printf "$CASE\t$DIS\tWGS $WGS_TS $WGS_NS\tWXS $WXS_TS $WXS_NS\tRNA $RNA_TS $RNA_NS\n"

}

function summarize_cases {
CASES=$1
DIS=$2

while read CASE; do

[[ $CASE = \#* ]] && continue  # Skip commented out entries

summarize_case $CASE $DIS >> $OUT

done < $CASES


}

summarize_cases "dat/UCEC_Cases.dat" UCEC
summarize_cases "dat/CCRC_Cases.dat" CCRC

echo Written to $OUT

