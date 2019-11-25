#!/bin/bash
export SHESKVER="0.0.5a"
export SHESKDIR="$(pwd)"
export SHESKLOG="$SHESKDIR/log.txt"

# Log Prep
if [ ! -w "$SHESKLOG" ]; then
    echo "[ SheskOS System Log ]" > "$SHESKLOG"
fi; echo -e "\n===== ( $(date) ) =====" >> "$SHESKLOG"

# Screen Prep
clear; echo "[ SheskOS ${SHESKVER} ]"
echo "(System) Starting SheskOS ${SHESKVER}..." >> "$SHESKLOG"
echo "(System) Root directory: ${SHESKDIR}" >> "$SHESKLOG"

# Load Core
echo "* Core Components"
source "$SHESKDIR/resources/core/check.sh"
source "$SHESKDIR/resources/core/import.sh"
source "$SHESKDIR/resources/core/sysmod.sh"

# Run Resource Checks
echo "* Package Checks"
check dialog

# Import Libraries
echo "* Library Imports"
import appexec
import color

# System Modules
echo "* System Modules"
sysmod shome

# Begin UI
echo "* UI Initialization"
sleep 1; clear; exec_shome

# Shut Down
clear; echo "* Goodbye!"; sleep 1
echo "(System) Shutting down..." >> "$SHESKLOG"
