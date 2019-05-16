# This is a simple script which will process all steps at once.
# Circa May 2019 this takes on the order of a day to run

source discover.paths.sh

>&2 echo Running 2_process_cases.sh
bash ./2_process_cases.sh
test_exit_status

>&2 echo Running 3a_make_SR_report.sh
bash ./3a_make_SR_report.sh
test_exit_status

>&2 echo Running 3b_append_suffix.sh
bash ./3b_append_suffix.sh
test_exit_status

>&2 echo Running 4_make_HAR_report.sh
bash ./4_make_HAR_report.sh
test_exit_status

>&2 echo Running 6_summarize_reports.sh
bash ./6_summarize_reports.sh
test_exit_status

>&2 echo Running 7_get_demographics.sh
bash ./7_get_demographics.sh
test_exit_status

>&2 echo Discovery complete
