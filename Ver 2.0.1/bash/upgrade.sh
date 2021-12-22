#!/bin/bash

			xterm -e "sudo -S killall packagekitd;
			sudo -S killall y2start;
            sudo -S zypper ref;
			sudo zypper dup -y --force-resolution --allow-vendor-change"

#
