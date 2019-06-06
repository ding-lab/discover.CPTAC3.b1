# This is a simple script which will process all steps at once.
# Circa May 2019 this takes on the order of a day to run

source discover.paths.sh

mkdir -p logs

>&2 echo Running 2_process_cases.sh
bash ./2_process_cases.sh 2> logs/2.err > logs/2.out
test_exit_status

>&2 echo Running 3a_make_SR_report.sh
bash ./3a_make_SR_report.sh 2> logs/3a.err > logs/3a.out
test_exit_status

>&2 echo Running 3b_append_suffix.sh
bash ./3b_append_suffix.sh 2> logs/3b.err > logs/3b.out
test_exit_status

>&2 echo Running 4_make_HAR_report.sh
bash ./4_make_HAR_report.sh 2> logs/4.err > logs/4.out
test_exit_status

>&2 echo Running 5_merge_AR.dat
bash ./5_merge_AR.dat 2> logs/5.err > logs/5.out
test_exit_status

>&2 echo Running 6_summarize_reports.sh
bash ./6_summarize_reports.sh 2> logs/6.err > logs/6.out
test_exit_status

>&2 echo Running 7_get_demographics.sh
bash ./7_get_demographics.sh 2> logs/7.err > logs/7.out
test_exit_status

>&2 echo Discovery complete
