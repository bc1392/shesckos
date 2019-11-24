#!/bin/bash

# Function declaration
check() {

    # Check for package and store output
    dpkg -s "$1">/dev/null; code=$?

    # Respond accordingly
    if [ $code != 0 ]; then
        echo "($(date) Package check FAILED: $1" >> "$SHESKLOG"
        echo "Error: Check failed for package, $1."
        exit 1
    else
        echo "($(date)) Package check succeeded: $1" >> "$SHESKLOG"
    fi

}

# Exit
echo "($(date)) Loaded core component: check" >> "$SHESKLOG"
return 0