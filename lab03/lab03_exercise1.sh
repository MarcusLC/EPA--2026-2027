
#!/bin/bash
# Lab 03 - Exercise 1
# Usage: ./lab03_exercise1.sh <maximum_processes>
# Example: ./lab03_exercise1.sh 100
# Original template-reused code removed to improve readability.

# Validate the supplied process threshold (first, if the number of expected parameters is right, then check if $1 is a number).
# Common error: Missing/non-numeric input causes comparison errors.
if [[ $# -ne 1 || ! $1 =~ ^[0-9]+$ ]]; then
	# Always a good practice in Bash to send the errors to stderr (i.e., ">&2" instead of stdout.
    echo "Usage: $0 <maximum_processes>" >&2
    # Likewise, one should stop execution if critical errors found (like missing mandatory parameters!).
	exit 1
fi

# Count running processes.
ct=$(ps -ef | wc -l)
#ct=$(( $(ps -ef | wc -l) - 1 )) 	#Alternative command, if you want to remove the ps header from the count and be more accurate.

# Compare the actual count against the supplied maximum.
# Common error: Reversed comparisons or incorrect equality handling.
if [ "$ct" -gt "$1" ]; then
    echo "Maximum number of processes exceeded"
else
    echo "The maximum number of processes NOT exceeded"
fi

