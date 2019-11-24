#!/bin/bash

# Function declaration
sysmod() {

    # Source file and store output
    source "$SHESKDIR/system/$1.sh"; code=$?

    # Respond accordingly
    if [ $code != 0 ]; then
        echo "Error: Could not connect system module, $1."
        exit 1
    fi

}

# Exit
return 0