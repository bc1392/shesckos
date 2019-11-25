#!/bin/bash

# Module Executor
exec_shome() {
    
    # Startup
    echo "(sHome) Module started." >> "$SHESKLOG"
    export DIALOGRC="${SHESKDIR}/resources/configs/dialog.ini"

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

        # Home Menu
        clear
        homeitem=$(dialog --stdout --no-cancel\
            --backtitle "SheskOS ${SHESKVER}"\
            --title "Home" --menu "" 0 50 0\
            "A" "Applications"\
            "-" "------------------------------"\
            "*" "Shut Down"\
        )

        # Submenu Logic
        if [ "$homeitem" == "A" ]; then

            # Application Menu
            subitem="-"
            while [ $subitem != "*" ]; do
                clear
                subitem=$(dialog --stdout --no-cancel\
                    --backtitle "SheskOS ${SHESKVER}"\
                    --title "Applications" --menu "" 0 50 0\
                    "${appmenu[@]}"\
                    "-" "------------------------------"\
                    "*" "Back"\
                )
                if [ "$subitem" != "*" ] & [ "$subitem" != "-" ]; then
                    if [ "$subitem" != "*" ]; then
                        appexec "${appdirs[$subitem]}"
                    fi
                fi
            done

        fi
    
    done
    
    echo "(sHome) Module finished." >> "$SHESKLOG"

}