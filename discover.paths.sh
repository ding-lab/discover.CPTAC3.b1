# Define project paths and environment variables

export PROJECT="CPTAC3.C325"

# use absolute path
export GDC_TOKEN="/home/mwyczalk_test/Projects/CPTAC3/Discover/token/gdc-user-token.2018-06-30T19_43_41.286Z.txt"

export CASEDISCOVER_HOME="CPTAC3.case.discover"
export QUERYGDC_HOME="$CASEDISCOVER_HOME/queryGDC"

export DISCOVER_CASES="dat/$PROJECT.cases.dat"

# Called after running scripts to catch fatal (exit 1) errors
# works with piped calls ( S1 | S2 | S3 > OUT )
# Usage:
#   bash script.sh DATA | python script.py > $OUT
#   test_exit_status # Calls exit V if exit value of V of either call not 0
function test_exit_status {
    # Evaluate return value for chain of pipes; see https://stackoverflow.com/questions/90418/exit-shell-script-based-on-process-exit-code
    # exit code 137 is fatal error signal 9: http://tldp.org/LDP/abs/html/exitcodes.html

    rcs=${PIPESTATUS[*]};
    for rc in ${rcs}; do
        if [[ $rc != 0 ]]; then
            >&2 echo Fatal error.  Exiting
            exit $rc;
        fi;
    done
}
