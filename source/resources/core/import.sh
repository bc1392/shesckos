#!/bin/bash

# Function declaration
import() {

    # Source file and store output
    source "$SHESKDIR/resources/libraries/$1.sh"; code=$?

    # Respond accordingly
    if [ $code != 0 ]; then
        echo "($(date)) FAILED to import library: $1" >> "$SHESKLOG"
        echo "Error: Cannot import library, $1."
        exit 1
    else
        echo "($(date)) Imported library: $1" >> "$SHESKLOG"
    fi

}

# Exit
echo "($(date)) Loaded core component: import" >> "$SHESKLOG"
return 0