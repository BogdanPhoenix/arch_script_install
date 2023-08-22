#!/bin/bash

chmod 744 ./scriptsInstall/*.sh

./scriptsInstall/Script_A_createSections.sh
./scriptsInstall/Script_B_download_pacstrap.sh
./scriptsInstall/Script_C_installArch.sh
