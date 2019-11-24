#!/bin/bash

# Application Executor
# Syntax: appexec "[id/location]"
appexec() {

    echo "(AppExec) Preparing to start: $1" >> "$SHESKLOG"

    # Check if application exists.
    if [ -r "$SHESKDIR/applications/$1/main.sh" ]; then

        # Application exists, execute it.
        echo "(AppExec) Shifting to application: $1" >> "$SHESKLOG"
        clear; bash "$SHESKDIR/applications/$1/main.sh"
        echo "(AppExec) Application has exited: $1" >> "$SHESKLOG"
        return 1

    else

        # Application does not exist.
        echo "(AppExec) Cannot find application: $1" >> "$SHESKLOG"
        return 0

    fi

}

# Exit
return 0