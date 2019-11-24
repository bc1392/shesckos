#!/bin/bash

# Function declaration
sysmod() {

    # Source file and store output
    source "$SHESKDIR/system/$1.sh"; code=$?

    # Respond accordingly
    if [ $code != 0 ]; then
        echo "($(date)) FAILED to connect system module: $1" >> "$SHESKLOG"
        echo "Error: Could not connect system module, $1."
        exit 1
    else
        echo "($(date)) Connected system module: $1" >> "$SHESKLOG"
    fi

}

# Exit
echo "($(date)) Loaded core component: sysmod" >> "$SHESKLOG"
return 0