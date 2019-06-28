# tumbleweed-noob-tool (current version 0.8)
A small script for openSuse Tumbleweed to... 
- install popular software, tools and drivers with a few ticks
- automatically reinstall software from previous linux installations by locating existing configuration files in your home folder
- perform system upgrades with a tick (zypper dup)
##

## Usage:
- From most graphical file managers: 

    Simply download and start the script. Make sure it's executable.



- From Terminal:

    $PATH/ktnt_08.sh
##

## Requirements:
- xterm 
- zenity 

(both should be preinstalled with openSuse Tumbleweed, script will check for both anyways and inform you if something is missing)
##

## Notes:

I'm not a professional coder in any ways. Expect "not so clean" code, but hey, it works.

Feel free to make suggestions or changes.
##

## Road to 1.0:
- complete translations throughout the script
- add current user to games group when installing steam controller support
- add some libs with steam installation for flawless gaming experience (some games still have issues due to missing libs on openSuse and wont work as intended - ping me if you know about one or two)
- add some additional must have applications
- add more revivable software (help needed)
- lock on one nvidia driver (if both selected) OR generate pop up message if both selected
- remove internal debugging chain
- add manuals
- purge temporary files on installation error / after system upgrade
- create a binary instead of havin a plain script
##
come to where the Pfeffer is
