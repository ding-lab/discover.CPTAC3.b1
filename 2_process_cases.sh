source discover.paths.sh

>&2 echo Iterating over $DISCOVER_CASES
if [ -z $OLDRUN ]; then
    >&2 echo No prior runs
elif [ ! -d $OLDRUN ]; then
    >&2 echo Old Run $OLDRUN does not exist
    exit 1
else
    >&2 echo Comparing with past run $OLDRUN
fi

# TODO: allow this to be run in parallel
# Move process_case to a separate script, have it be called in parallel context
# Use rungo as a template: https://github.com/ding-lab/TinDaisy/blob/master/src/rungo

# Note that this should be run in a tmux environment, it can take several days to run

function process_case {
    CASE=$1
    DIS=$2

    if [ -z $CASE ]; then
    return
    fi

    >&2 echo Processing $CASE \($DIS\)

    bash CPTAC3.case.discover/get_sample.sh $CASE 
    # Writes dat/$CASE/sample_from_case.$CASE.dat
    test_exit_status

    OUT="dat/cases/$CASE/sample_from_case.$CASE.dat"
    if [ ! -s $OUT ]; then
        >&2 echo $OUT is empty.  Skipping case
        return
    fi

    bash CPTAC3.case.discover/get_read_groups.sh $CASE 
    # Writes dat/$CASE/read_group_from_case.$CASE.dat
    test_exit_status

    # Evaluate old vs. new to see if can short-circuit the get_submitted_reads.sh evaluation
    NEW_RESULT="dat/cases/$CASE/read_group_from_case.${CASE}.dat"

    SHORT_CIRCUIT=0
    if [ ! -z $OLDRUN ]; then
        OLD_RESULT="$OLDRUN/dat/cases/$CASE/read_group_from_case.${CASE}.dat"
        if [ -e $OLD_RESULT ]; then
            OLDMD5=$(md5sum $OLD_RESULT | cut -f 1 -d ' ')
            NEWMD5=$(md5sum $NEW_RESULT | cut -f 1 -d ' ')
            printf "Comparing $OLD_RESULT and $NEW_RESULT  \n  " 1>&2

            if [ "$OLDMD5" == "$NEWMD5" ]; then  # matching results.  Copy old to new 
                SHORT_CIRCUIT=1
                printf " OLDRUN Match, will copy old results\n" 1>&2
            else
                printf " OLDRUN Mismatch, re-evaluating results \n" 1>&2
            fi
        fi  
    else
        printf " OLDRUN not defined, evaluating results \n" 1>&2
    fi

    if [ "$SHORT_CIRCUIT" == 1 ]; then
        OLD_RESULT="$OLDRUN/dat/cases/$CASE/SR_from_read_group.$CASE.dat"
        NEW_RESULT="dat/cases/$CASE/SR_from_read_group.$CASE.dat"
        >&2 echo Copying $OLD_RESULT to $NEW_RESULT
        cp $OLD_RESULT $NEW_RESULT
    else
        bash CPTAC3.case.discover/get_submitted_reads.sh $CASE 
        # Writes dat/cases/$CASE/SR_from_read_group.$CASE.dat.tmp
        # and dat/cases/$CASE/SR_from_read_group.$CASE.dat
    fi
    test_exit_status

}



# Case file has two tab separated columns, case name and disease
while read L; do

[[ $L = \#* ]] && continue  # Skip commented out entries

CASE=$(echo "$L" | cut -f 1 )
DIS=$(echo "$L" | cut -f 2 )

process_case $CASE $DIS

done < $DISCOVER_CASES
