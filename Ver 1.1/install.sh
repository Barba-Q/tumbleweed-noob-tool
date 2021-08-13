#!/bin/bash
apwd="$(pwd | sed 's/ /\ /g')"

tar -zxvf "$apwd"/tumbleweednoobtool.tar.gz

xterm -e   "sudo cp '$apwd'/tumbleweednoobtool.sh /usr/bin/;
            sudo cp '$apwd'/tumbleweednoobtool.png /usr/share/icons/;
            sudo cp '$apwd'/tumbleweednoobtool.desktop /usr/share/applications/;
            sudo rm '$apwd'/tumbleweednoobtool.sh;
            sudo rm '$apwd'/tumbleweednoobtool.png;
            sudo rm '$apwd'/tumbleweednoobtool.desktop;
            read -s -n1 -p 'All done. Press any key to close...'"
