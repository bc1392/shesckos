#!/bin/bash
export SHESKVER="0.0.2"
export SHESKDIR="$(pwd)"
export SHESKLOG="$SHESKDIR/log.txt"

# Log Prep
if [ ! -w "$SHESKLOG" ]; then
    echo "[ SHESKOS LOG ]" > "$SHESKLOG"
fi; echo -e "\n========== [ RESET > $(date) ] ==========" >> "$SHESKLOG"

# Screen Prep
clear; echo "[ SHESKOS ${SHESKVER} LOADER ]"
echo "($(date)) Starting SheskOS ${SHESKVER}..." >> "$SHESKLOG"

# Load Core
echo -e "\n* Core Components:"
echo "    - Check";  source "$SHESKDIR/resources/core/check.sh"
echo "    - Import"; source "$SHESKDIR/resources/core/import.sh"
echo "    - Sysmod"; source "$SHESKDIR/resources/core/sysmod.sh"

# Run Resource Checks
echo -e "\n* Resource Checks:"
echo "    - GNU Dialog"; check dialog

# Import Libraries
echo -e "\n* Library Imports:"
echo "    - Console Colors"; import color

# System Modules
echo -e "\n* System Modules:"
echo "    - sHome"; sysmod shome

# Begin UI
echo -e "\n* Starting UI..."
sleep 1; clear; exec_shome

# Shut Down
sleep 1; clear; echo "Goodbye!"
echo "($(date)) Shutting down SheskOS ${SHESKVER}..." >> "$SHESKLOG"
