
# Run with -J 10 to process 10 cases at a time

bash CPTAC3.case.discover/process_cases.sh $@

rc=$?
if [[ $rc != 0 ]]; then
    >&2 echo Fatal ERROR $rc: $!.  Exiting.
    exit $rc;
fi

