# Define project paths and environment variables

export PROJECT="discover.20190605"
export GDC_TOKEN="/home/mwyczalk_test/Projects/CPTAC3/discover/token/gdc-user-token.2019-06-06T04_48_59.198Z.txt"

export QUERYGDC_HOME="CPTAC3.case.discover/queryGDC"

export DISCOVER_CASES="/home/mwyczalk_test/Projects/CPTAC3/CPTAC3.catalog/CPTAC3.cases.dat"
#export DISCOVER_CASES="dat/test-case.dat"

# Implemeting short-circuiting - do not query results which have already been done before in the project below
OLDRUN="/home/mwyczalk_test/Projects/CPTAC3/discover/discover.20190514"

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
