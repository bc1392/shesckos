#!/bin/bash

# Module Executor
exec_login() {

    # Startup
    echo "(Login) Module started." >> "$SHESKLOG"
    export DIALOGRC="${SHESKDIR}/resources/configs/dialog.ini"
    DIALOGOP="--backtitle Login"

    # Placeholder
    dialog ${DIALOGOP} --msgbox "A login shell will go here." 5 32

    # Simulate a "Good" Login
    echo "(Login) Module finished." >> "$SHESKLOG"
    return 0

}