#!/bin/bash

# Function declaration
sysmod() {

    # Source file and store output
    source "$SHESKDIR/modules/$1.sh"; code=$?

    # Respond accordingly
    if [ $code != 0 ]; then
        echo "(SysMod) FAILED to connect module: $1" >> "$SHESKLOG"
        echo; echo "Error: Could not connect system module, $1."
        exit 1
    else
        echo "(SysMod) Connected module: $1" >> "$SHESKLOG"
    fi

}

# Exit
echo "(Loader) Core component loaded: sysmod" >> "$SHESKLOG"
return 0