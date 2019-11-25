#!/bin/bash

# Preperation
export DIALOGRC="${SHESKDIR}/applications/sysview/resources/dialog.ini"
export DIALOGOP="--backtitle SysView"
export DIALOGPB="dialog ${DIALOGOP} --progressbox 3 40"

# Load Apps
echo "Loading applications..." | $DIALOGPB
apps=""; appcount=0; applist="${SHESKDIR}/applications/list.txt"
while read LINE; do
    unset LINEXP; read -r -a LINEXP <<< "$LINE"
    appcount=$((appcount+1));
    apps="${apps}${LINEXP[@]:1} (${LINEXP[0]})\n"
done < "${applist}"
echo "(SysView) ${appcount} application(s) found." >> "$SHESKLOG"
sleep 0.75

# Gather Modules
echo "Gathering modules..." | $DIALOGPB
olddir="$(pwd)"; cd "${SHESKDIR}/modules"
modules="$(ls -1 --color=never *.sh)"
modulecount=$(echo "${modules}" | wc -l); cd "$olddir"
echo "(SysView) ${modulecount} module(s) found." >> "$SHESKLOG"
sleep 0.5

# Gather Libraries
echo "Gathering libraries..." | $DIALOGPB
olddir="$(pwd)"; cd "${SHESKDIR}/resources/libraries"
libraries="$(ls -1 --color=never *.sh)"
librarycount=$(echo "${libraries}" | wc -l); cd "$olddir"
echo "(SysView) ${librarycount} library(s) found." >> "$SHESKLOG"
sleep 0.75

# Gather Core Components
echo "Gathering cores..." | $DIALOGPB
olddir="$(pwd)"; cd "${SHESKDIR}/resources/core"
cores="$(ls -1 --color=never *.sh)"
corecount=$(echo "${cores}" | wc -l); cd "$olddir"
echo "(SysView) ${corecount} core component(s) found." >> "$SHESKLOG"
sleep 0.25

# Menu System
clear; mainitem="-"
while [ "$mainitem" != "*" ]; do

    # Main Menu
    mainitem=$(dialog --stdout --no-cancel ${DIALOGOP}\
        --title "System Viewer" --menu "" 0 50 0\
        "A" "Applications"\
        "M" "System Modules"\
        "L" "Libraries"\
        "C" "Cores"\
        "-" "------------------------------"\
        "*" "Quit"\
    )

    # Main Logic
    if [ "$mainitem" != "-" ] ; then

        # Application List
        if [ "$mainitem" == "A" ]; then

            height=$((appcount+6))
            if $((height>LINES-2)); then
                height=$((LINES-2))
            fi

            dialog ${DIALOGOP} --title "Installed Applications"\
                --msgbox "${apps}\n(${appcount} Items)" $height 50
        
        # Module List
        elif [ "$mainitem" == "M" ]; then

            height=$((modulecount+6))
            if $((height>LINES-2)); then
                height=$((LINES-2))
            fi

            dialog ${DIALOGOP} --title "System Modules"\
                --msgbox "$(echo "$modules" | tr ' ' '\n')\n\n(${modulecount} Items)" $height 50
        
        # Library List
        elif [ "$mainitem" == "L" ]; then

            height=$((librarycount+6))
            if $((height>LINES-2)); then
                height=$((LINES-2))
            fi

            dialog ${DIALOGOP} --title "Installed Libraries"\
                --msgbox "$(echo "$libraries" | tr ' ' '\n')\n\n(${librarycount} Items)" $height 50
        
        # Library List
        elif [ "$mainitem" == "C" ]; then

            height=$((corecount+6))
            if $((height>LINES-2)); then
                height=$((LINES-2))
            fi

            dialog ${DIALOGOP} --title "Core Components"\
                --msgbox "$(echo -n "$cores" | tr " " "!")\n\n(${corecount} Items)" $height 50
        
        # End of main choices.
        fi

    # End of main logic.
    fi

done