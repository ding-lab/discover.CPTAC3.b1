# Add suffix to sample_name in SR file, based on a suffix list
#
# Usage:
#     bash append_suffix.sh SUFFIX_LIST SR_FILE
#
# Writes to STDOUT.  If SR_FILE is -, read in from stdin
#
# SUFFIX_LIST is mandatory.  It is a TSV file listing a UID (UUID or Aliquot ID) in first column, 
# Second column is suffix to be added to sample_name (i.e., first column of SR) 
#
# It is assumed that each UID has a unique match in SR file, and it is an error
# (or warning) if it does not exist
#
# Original data file is renamed to -orig
#
# Things to implement
# * Want to not write intermediates to disk
# * want to check to make sure don't have multiple matches
# Make a chain of grep / awk commands which is then eval'd. 

# NOT IMPLEMENTED
# This is not currently implemented, but will need to be done for every SR discovery in the future
# Or else these cases not be discovered automatically
SUFFIX_LIST="/home/mwyczalk_test/Projects/CPTAC3/CPTAC3.catalog/SampleRename.dat"

if [ ! -e $SUFFIX_LIST ]; then
    >&2 echo Error: File does not exist $SUFFIX_LIST
    exit 1
fi

DATNEW="dat/discover.20190128.SR.dat"
DATORIG="dat/discover.20190128.SR-orig.dat"

CMD_ALL=""
FIRST=1

while read SL; do

    # skip comments
    [[ $SL = \#* ]] && continue


    ID=$(echo "$SL" | cut -f 1)
    SUFFIX=$(echo "$SL" | cut -f 2)

    #awk -v id=$ID -v suf=$SUFFIX 'BEGIN{FS="\t";OFS="\t"}{if ($0 ~ id) $1 = $1 suf; print $0 }' $DATTEST
    CMD="awk -v id=$ID -v suf=$SUFFIX 'BEGIN{FS=\"\t\";OFS=\"\t\"}{if (\$0 ~ id) \$1 = \$1 suf; print \$0 }'"

    if [ $FIRST == 0 ] ; then
        CMD_ALL=" $CMD_ALL | $CMD " 
    else
        CMD_ALL=" $CMD "
        FIRST=0
    fi

done < $SUFFIX_LIST

cat $DATORIG | eval $CMD_ALL > $DATNEW

>&2 echo Reading $DATORIG
>&2 echo Updating sample names based on $SUFFIX_LIST complete.
>&2 echo Saved as $DATNEW

