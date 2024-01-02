#!/usr/bin/env bash

echo "PID:$$"
echo "** Paste next line into a seperate termainal"
echo "sudo strace -c -p $$"

# use bash parameter expansions.
readonly WORKING_PATH=$(pwd)
readonly SCRIPT_NAME=$(basename "$0")
readonly SCRIPT_PATH=${0}
readonly SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
readonly HOME_DIR=~
readonly EXTENSION="${SCRIPT_NAME##*.}"
readonly FILENAME="${SCRIPT_NAME%.*}"

# use readlink to find the full canonical path after striping it above. 
if [[ $(command -v greadlink) ]]; then 
    # mac requires 'brew install coreutils'
    readonly SCRIPT_FULL_PATH="$(dirname "$(greadlink -f "$0")")/${SCRIPT_NAME}"
else
    readonly SCRIPT_FULL_PATH="$(dirname "$(readlink -f "$0")")/${SCRIPT_NAME}"
fi

while true; do
echo -n "."

# this doesn't get traced as it's a seperate process
${SCRIPT_DIR}/create_and_copy.sh

sleep 1
done