#!/bin/bash

# Module Executor
exec_shome() {
    
    # Startup
    echo "(sHome) Module started." >> "$SHESKLOG"
    export DIALOGRC="${SHESKDIR}/resources/configs/dialog.ini"
    export DIALOGOP="--backtitle SheskOS"

    # Generate App Menu
    appcount=0; menucount=0;
    applist="${SHESKDIR}/applications/list.txt"
    while read LINE; do
        unset LINEXP; read -r -a LINEXP <<< "$LINE"; appcount=$((appcount+1));
        menucount=$((menucount+1)); appmenu[$((menucount-1))]="$((appcount-1))"
        menucount=$((menucount+1)); appmenu[$((menucount-1))]="${LINEXP[@]:1}"
        appdirs[$((appcount-1))]=${LINEXP[0]}
    done < "${applist}"
    echo "(sHome) ${appcount} application(s) found." >> "$SHESKLOG"

    # Menu Loop
    homeitem="-"
    while [ "$homeitem" != "*" ]; do

        # Reinitialize
        export DIALOGRC="${SHESKDIR}/resources/configs/dialog.ini"
        export DIALOGOP="--backtitle SheskOS"

        # Home Menu
        clear
        homeitem=$(dialog --stdout --no-cancel ${DIALOGOP}\
            --title "Home" --menu "" 0 50 0\
            "A" "Applications"\
            "-" "------------------------------"\
            "*" "Shut Down"\
            "!" "Lock"\
        )

        # Submenu Logic
        if [ "$homeitem" == "A" ]; then

            # Application Menu
            clear; subitem="-"
            subitem=$(dialog --stdout --no-cancel ${DIALOGOP}\
                --title "Applications" --menu "" 0 50 0\
                "${appmenu[@]}"\
                "-" "------------------------------"\
                "*" "Back"\
            )

            # Launching Logic
            if [ "$subitem" != "*" ] & [ "$subitem" != "-" ]; then
                if [ "$subitem" != "*" ]; then
                    appexec "${appdirs[$subitem]}"
                fi
            fi

        elif [ "$homeitem" == "!" ]; then

            # Locking Loop
            logbad=1
            while [ $logbad != 0 ]; do
                exec_login; logbad=$?
            done

        fi
    
    done
    
    echo "(sHome) Module finished." >> "$SHESKLOG"

}