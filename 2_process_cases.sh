source discover.paths.sh

# run NJOBS in parallel.  If 0, disable parallel mode. Default 0
NJOBS=10

function test_exit_status {
    # Evaluate return value for chain of pipes; see https://stackoverflow.com/questions/90418/exit-shell-script-based-on-process-exit-code
    rcs=${PIPESTATUS[*]};
    for rc in ${rcs}; do
        if [[ $rc != 0 ]]; then
            >&2 echo $SCRIPT Fatal ERROR.  Exiting.
            exit $rc;
        fi;
    done
}

# Evaluate given command CMD either as dry run or for real
function run_cmd {
    CMD=$1
    DRYRUN=$2
    QUIET=$3

    if [ -z $QUIET ]; then
        QUIET=0
    fi

    if [ "$DRYRUN" == "d" ]; then
        if [ "$QUIET" == 0 ]; then
            >&2 echo Dryrun: $CMD
        fi
    else
        if [ "$QUIET" == 0 ]; then
            >&2 echo Running: $CMD
        fi
        eval $CMD
        test_exit_status
    fi
}

>&2 echo Iterating over $DISCOVER_CASES
if [ -z $OLDRUN ]; then
    >&2 echo No prior runs
elif [ ! -d $OLDRUN ]; then
    >&2 echo Old Run $OLDRUN does not exist
    exit 1
else
    >&2 echo Comparing with past run $OLDRUN
    OR_ARG="-R $OLDRUN"
fi

# TODO: allow this to be run in parallel
# Move process_case to a separate script, have it be called in parallel context
# Use rungo as a template: https://github.com/ding-lab/TinDaisy/blob/master/src/rungo

# Note that this should be run in a tmux environment, it can take several days to run

# Used for `parallel` job groups 
NOW=$(date)
MYID=$(date +%Y%m%d%H%M%S)

if [ $NJOBS == 0 ] ; then
    >&2 echo Running single case at a time \(single mode\)
else
    >&2 echo Job submission with $NJOBS cases in parallel
fi

LOGD="./logs"
mkdir -p $LOGD

# Case file has two tab separated columns, case name and disease
while read L; do

    [[ $L = \#* ]] && continue  # Skip commented out entries

    CASE=$(echo "$L" | cut -f 1 )
    DIS=$(echo "$L" | cut -f 2 )

    STDOUT_FN="$LOGD/${CASE}.out"
    STDERR_FN="$LOGD/${CASE}.err"

    CMD="bash CPTAC3.case.discover/process_case.sh $OR_ARG $CASE $DIS > $STDOUT_FN 2> $STDERR_FN"

    if [ $NJOBS != 0 ]; then
        JOBLOG="$LOGD/$CASE.log"
        CMD=$(echo "$CMD" | sed 's/"/\\"/g' )   # This will escape the quotes in $CMD 
        CMD="parallel --semaphore -j$NJOBS --id $MYID --joblog $JOBLOG --tmpdir $LOGD \"$CMD\" "
    fi

    run_cmd "$CMD" $DRYRUN
    >&2 echo Written to $STDOUT_FN

    if [ $JUSTONE ]; then
        break
    fi

done < $DISCOVER_CASES

if [ $NJOBS != 0 ]; then
    # this will wait until all jobs completed
    CMD="parallel --semaphore --wait --id $MYID"
    run_cmd "$CMD" $DRYRUN
fi

