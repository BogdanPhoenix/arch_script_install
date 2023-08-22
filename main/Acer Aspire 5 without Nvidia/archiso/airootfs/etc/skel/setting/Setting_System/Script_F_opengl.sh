#!/bin/bash

sudo pacman -S --noconfirm xf86-video-intel

sudo sh -c 'echo "MESA_GL_VERSION_OVERRIDE=4.5" >> /etc/environment'
sudo sh -c 'echo "MESA_GLSL_VERSION_OVERRIDE=450" >> /etc/environment'
