#!/bin/bash
# Usage: ./lab04_cpu_count_3.sh MIN_NUM_CORES
# Example: ./lab04_cpu_count_3.sh 4

usage() {
    echo "Usage: $0 MIN_NUM_CORES"
}

# Two possible approaches here: One might choose to preserve Exercise 2's behaviour and build the chosen commands on top of this, or modify it (e.g., by replacing the input argument behaviour with an interactive prompt). This sample solution uses the former (i.e., respect Exercise 2's behaviour).
if [ -z "$1" ]; then
    usage
    exit 1
fi

if [[ ! "$1" =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: MIN_NUM_CORES must be a positive integer."
    exit 1
fi

num_cpu=$(nproc)

# New command 1: hostname identifies the machine being assessed,
# making CPU-check results traceable to a particular server.
server_name=$(hostname)

# New command 2: date records when the assessment was performed,
# making the diagnostic output more useful for auditing.
check_time=$(date "+%Y-%m-%d %H:%M:%S")

echo "Server: $server_name"
echo "Check time: $check_time"

if [ "$num_cpu" -lt "$1" ]; then
    echo "Error: Only $num_cpu CPUs available; $1 required."
    exit 1
fi

echo "OK: $num_cpu CPUs available; $1 required."

#Btw, it would be better to explain how the two new commands improve the business logic, rather than merely introducing them (although this requirement is mostly an "excuse" for you to practice commands of your personal interest).

