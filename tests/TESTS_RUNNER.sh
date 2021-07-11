#!/bin/bash

#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#
# PURPOSE:       Main test script that will call all the individual unitary tests.
# TITLE:         TESTS_RUNNER
# AUTHOR:        Jose Gracia
# VERSION:       See in CHANGELOG.md
# NOTES:         This script does not contain any test, it only calls all the tests one by one.
# BASH_VERSION:  5.1.4(1)-release (x86_64-pc-linux-gnu)
# LICENSE:       see in ../LICENSE (project root) or https://github.com/Josee9988/project-template/blob/master/LICENSE
# GITHUB:        https://github.com/Josee9988/
# REPOSITORY:    https://github.com/Josee9988/project-template
# ISSUES:        https://github.com/Josee9988/project-template/issues
# MAIL:          jgracia9988@gmail.com
#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#

LGREEN='\033[0;32m'
NC='\033[0m' # No Color
TESTS_TRASH_DIR="tests/.ignore.tests_trash/"
declare -a test_files=("tests/project_scaffolding_test.sh" "tests/custom_data_test.sh") # all the tests

center() {
    term_width="$(tput cols)"
    padding="$(printf '%0.1s' +{1..500})"
    echo -e "\n${LGREEN}$(printf '%*.*s %s %*.*s\n' 0 "$(((term_width - 2 - ${#1}) / 2))" "$padding" "$1" 0 "$(((term_width - 1 - ${#1}) / 2))" "$padding")${NC}"
}

rm -r $TESTS_TRASH_DIR 2>/dev/null || : # remove any possible old test run trash files

# run all the tests
for file in "${test_files[@]}"; do
    mkdir -p tests/.ignore.tests_trash # create the files where the tests will attack upon
    center "TEST: running test ./$file"
    ./"$file"              # run the test
    rm -r $TESTS_TRASH_DIR # remove the previously created files
done
