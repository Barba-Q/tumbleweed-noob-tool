# tumbleweed-noob-tool 
_(current version 2.0.1)_
# 2.0
## Usage:
- Download the folder and execute the tnt file (./tnt)
- The folders are relevant and should not be re- moved or changed (For now)

## Requirements:
- xterm

## Known issues:
- Autosetup is not implemented yet
- Software resurrection is not implemented yet


# 1.x

A small script for openSuse Tumbleweed to... 

- install popular software, tools and hardware-drivers with a few clicks
- automatically reinstall software you had on previous linux installations by locating existing configuration files in your home folder
- perform system upgrade with a tick (zypper dup)
- One click set up for very unexperienced users, it will...

        -  add repositories for multimediapackages (Packman) and NVIDIA drivers. 
        
        - install super common software
        
                    audacity; chromium; discord; obs-studio; vlc; steam; wine; youtube-dl 
                    
        - install multimedia codecs
        
        - install microsoft licensed True Type Fonts
        
##

## Usage:
- From most graphical file managers: 

    Simply download and start the script inside the tar.gz. Make sure it's executable.
    You can "Install" it by execute the install.sh. It will copy all the files to /usr/share/... to have a global service and menu entry

- From Terminal:

    sh $PATH/install.sh
        
##

## Requirements:
- xterm 
- zenity 

(both should be preinstalled with openSuse Tumbleweed, script will check for both anyways and inform you if something is missing; Zenity will be installed right away within the script)

##

## Changelog:
2.0.1
- Initial relase with new, python based GUI
- Autothingy and Softwareresurrection are not implemented yet

1.1
- Fixed error when resurrecting software
- Fixed typos
- Cleanup

1.0
- Fixed failure on codec installation
- Script now installable
- Systemupgrade now fully automatic

0.95
- Some minor cleanup
- Fixed Systemupgrade

0.94
- Added "One click set up"

0.92 / 0.93
- Fixed the script hanging on repository prompt while adding them.
- Added multimedia-codecs to the tool's section

0.91:
- Major bug fixes causing the script to crash for a lot of reasons
- Reworked exec routine to get rid of multiple password promts

0.9:
- Minor bug fixes causing script to exit for no obvious reason
- Added installation of glibc-locales when steam is selected for install.
    Fixes "text not visible" bug in most (affected) source games (e.g. Insurgency, Days Of Infamy, Garrys Mod)
- Debug chain removed
- Removed german translation 'til 1.0 is reached

##


## Notes:

I'm not a professional coder in any ways. Expect "not so clean" code, but hey, it works.

Feel free to make suggestions or changes.
##

## Road to 1.5:
- have a binary instead of a plain script
- add current user to "games" group when installing steam controller support
- add some libs with steam installation for flawless gaming experience (some games still have issues due to missing libs on openSuse and wont work as intended)
- add some additional applications
- add more revivable software (help needed)
- lock on one nvidia driver (if both selected) OR generate pop up message if both selected
- add manuals
- purge temporary files on installation error / after system upgrade
- add chrome browser

##
_powered by knietief.com - come to where the Pfeffer wächst_
