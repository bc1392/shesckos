#!/bin/bash

# Start: Inialize.
echo "[S] Making SheskOS..."

# Task 0: Prepare lists.
echo -e "\n[0] List Preperation:"
echo "    ~ Scripts"; scripts=(\
    main.sh\
    resources/core/check.sh\
    resources/core/import.sh\
    resources/core/sysmod.sh\
    resources/libraries/color.sh\
    system/shome.sh\
)

# Task 1: Flag scripts as executable.
echo -e "\n[1] Execution Flags:"
echo "    +x : (make.sh)"; chmod +x "make.sh"
echo "    +x : (run.sh)"; chmod +x "run.sh"
for item in "${scripts[@]}"; do
    echo "    +x : $item"; chmod +x "source/$item"
done

# Final: Finish up.
echo -e "\n[F] Make complete."