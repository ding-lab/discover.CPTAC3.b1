source discover.paths.sh

echo Iterating over $DISCOVER_CASES

# Note that since this takes some time to process, can run it in background as,
# nohup bash 2_process_cases.sh &> 2.out &

function process_case {
CASE=$1
DIS=$2

if [ -z $CASE ]; then
return
fi

>&2 echo Processing $CASE \($DIS\)

bash CPTAC3.case.discover/get_sample.sh $CASE 
test_exit_status
bash CPTAC3.case.discover/get_read_groups.sh $CASE 
test_exit_status
bash CPTAC3.case.discover/get_submitted_reads.sh $CASE 
test_exit_status

}



while read L; do

[[ $L = \#* ]] && continue  # Skip commented out entries

CASE=$(echo "$L" | cut -f 1 )
DIS=$(echo "$L" | cut -f 2 )

process_case $CASE $DIS

done < $DISCOVER_CASES
