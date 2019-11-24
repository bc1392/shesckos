#!/bin/bash

# Function declaration
check() {

    # Check for package and store output
    dpkg -s "$1">/dev/null; code=$?

    # Respond accordingly
    if [ $code != 0 ]; then
        echo "(Check) Package check FAILED: $1" >> "$SHESKLOG"
        echo; echo "Error: Check failed for package, $1."
        exit 1
    else
        echo "(Check) Package check succeeded: $1" >> "$SHESKLOG"
    fi

}

# Exit
echo "(Loader) Core component loaded: check" >> "$SHESKLOG"
return 0