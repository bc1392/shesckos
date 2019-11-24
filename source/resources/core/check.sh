#!/bin/bash

# Function declaration
check() {

    # Source file and store output
    source "$SHESKDIR/resources/checks/$1.sh"; code=$?

    # Respond accordingly
    if [ $code != 0 ]; then
        echo "Error: Check failed for component, $1."
        exit 1
    fi

}

# Exit
return 0