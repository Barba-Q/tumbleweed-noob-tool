#!/bin/bash



			xterm $1 -e "sudo -S killall packagekitd;
			sudo -S killall y2start;
			sudo -S zypper --no-gpg-checks --non-interactive ar http://download.nvidia.com/opensuse/tumbleweed/  NVIDIA;
			sudo -S zypper --no-gpg-checks --non-interactive ar http://ftp.gwdg.de/pub/linux/packman/suse/openSUSE_Tumbleweed/ Multimedia;
            sudo -S zypper ref;
			sudo -S zypper in -l -y --allow-vendor-change $2 $3 $4 $5 $6 $7 $8"

#
