#!/bin/bash

# Function declaration
import() {

    # Source file and store output
    source "$SHESKDIR/resources/libraries/$1.sh"; code=$?

    # Respond accordingly
    if [ $code != 0 ]; then
        echo "Error: Cannot import library, $1."
        exit 1
    fi

}

# Exit
return 0