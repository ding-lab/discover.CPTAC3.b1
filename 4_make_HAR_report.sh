source discover.paths.sh

SR="dat/${PROJECT}.SR.dat"
HAR="dat/${PROJECT}.HAR.dat"

bash CPTAC3.case.discover/get_harmonized_reads.sh $SR $HAR
rc=$?
if [[ $rc != 0 ]]; then
    >&2 echo Fatal ERROR $rc: $!.  Exiting.
    exit $rc;
fi

