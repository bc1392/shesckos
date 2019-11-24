#!/bin/bash

# Function declaration
import() {

    # Source file and store output
    source "$SHESKDIR/resources/libraries/$1.sh"; code=$?

    # Respond accordingly
    if [ $code != 0 ]; then
        echo "(Import) FAILED to import library: $1" >> "$SHESKLOG"
        echo; echo "Error: Cannot import library, $1."
        exit 1
    else
        echo "(Import) Imported library: $1" >> "$SHESKLOG"
    fi

}

# Exit
echo "(Loader) Core component loaded: import" >> "$SHESKLOG"
return 0