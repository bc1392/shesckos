#!/bin/bash

# Module Executor
exec_shome() {

    echo "(sHome) Module started." >> "$SHESKLOG"
    export DIALOGRC="${SHESKDIR}/resources/configs/dialog.ini"

    dialog --backtitle "ShesckOS ${SHESKVER}" --msgbox "The 'hello' application will be launched." 5 45
    appexec "hello"
    dialog --backtitle "ShesckOS ${SHESKVER}" --msgbox "The 'hello' application has finished." 5 45
    
    echo "(sHome) Module finished." >> "$SHESKLOG"

}