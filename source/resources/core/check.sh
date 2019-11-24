#!/bin/bash

# Function declaration
check() {

    # Source file and store output
    source "$SHESKDIR/resources/checks/$1.sh"; code=$?

    # Respond accordingly
    if [ $code != 0 ]; then
        echo "($(date)) Component check FAILED: $1" >> "$SHESKLOG"
        echo "Error: Check failed for component, $1."
        exit 1
    else
        echo "($(date)) Component check succeeded: $1" >> "$SHESKLOG"
    fi

}

# Exit
echo "($(date)) Loaded core component: check" >> "$SHESKLOG"
return 0