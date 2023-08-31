#!/bin/bash

sudo pacman -S qemu-full qemu-block-gluster qemu-block-iscsi libvirt virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat ebtables iptables libguestfs

sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
sudo usermod -aG libvirt $(whoami)
sudo systemctl restart libvirtd.service
sudo virsh net-autostart default
sudo virsh net-start default
