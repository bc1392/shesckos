#!/bin/bash

# Formatting codes.
bold=`echo -en "\e[1m"`
dim=`echo -en "\e[2m"`
normal=`echo -en "\e[0m"`
red=`echo -en "\e[31m"`
green=`echo -en "\e[32m"`
white=`echo -en "\e[97m"`
default=`echo -en "\e[39m"`

# Start: Inialize.
echo "${bold}${white}[S] Making SheskOS...${default}${normal}"
errors=0; errsect=""

# Task 0: Prepare lists.
echo -e "\n${bold}${white}[0] List Preperation:${default}${normal}"
echo "    ${green}l1${default} : Packages"; packages=(\
    bash dialog
)
echo "    ${green}l2${default} : Scripts"; scripts=(\
    main.sh\
    resources/core/check.sh\
    resources/core/import.sh\
    resources/core/sysmod.sh\
    resources/libraries/appexec.sh\
    resources/libraries/color.sh\
    modules/shome.sh\
    applications/hello/main.sh\
    applications/sysview/main.sh\
)

# Task 1: Check packages.
olderrors=$errors
echo -e "\n${bold}${white}[1] Package Checks:${default}${normal}"
for item in "${packages[@]}"; do
    dpkg -s "$item">/dev/null; code=$?
    if [ $code != 0 ]; then
        errors=$((errors+1))
        echo "    ${red}!?${default} : $item"
    else
        echo "    ${green}OK${default} : $item"
    fi
done
if (( olderrors < errors )); then
    errsect="${errsect} #1"
fi

# Task 2: Flag scripts as executable.
olderrors=$errors
echo -e "\n${bold}${white}[2] Execution Flags:${default}${normal}"
for item in "${scripts[@]}"; do
    if [ ! -w "source/$item" ]; then
        errors=$((errors+1))
        echo "    ${red}!x${default} : $item"
    else
        echo "    ${green}+x${default} : $item"; chmod +x "source/$item"
    fi
done
if (( olderrors < errors )); then
    errsect="${errsect} #2"
fi

# Final: Finish up.
echo -e "\n${bold}${white}[F] Make complete.${default}${normal}"
if (( errors > 0 )); then
    echo "${red}Finished with ${bold}${errors} error(s)${normal}${red}.${default}"
    echo "${red}Check in section(s):${bold}${errsect}${normal}"
else
    echo "${green}Finished without any errors.${default}"
fi