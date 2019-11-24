#!/bin/bash

# Module Executor
exec_shome() {

    echo "($(date)) sHome started." >> "$SHESKLOG"
    
    dialog --backtitle "ShesckOS ${SHESKVER}" --msgbox "Hello World!" 5 17

    echo "($(date)) sHome finished." >> "$SHESKLOG"

}