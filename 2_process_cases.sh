source discover.paths.sh

DAT="dat/$PROJECT.cases.dat"

# Note that since this takes some time to process, can run it in background as,
# nohup bash 2_process_cases.sh &> 2.out &

function process_case {
CASE=$1
DIS=$2

if [ -z $CASE ]; then
return
fi

>&2 echo Processing $CASE \($DIS\)

bash $CASEDISCOVER_HOME/get_sample.sh $CASE 
bash $CASEDISCOVER_HOME/get_read_groups.sh $CASE 
bash $CASEDISCOVER_HOME/get_submitted_reads.sh $CASE 

}



while read L; do

[[ $L = \#* ]] && continue  # Skip commented out entries

CASE=$(echo "$L" | cut -f 1 )
DIS=$(echo "$L" | cut -f 2 )

process_case $CASE $DIS


done < $DAT


