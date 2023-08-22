#!/bin/bash

path="./GUI"
files="$path/*.sh"

chmod -R 744 $files

"$path"/Script_A_downloanPackeg.sh
"$path"/Script_B_downloadDesktop.sh
