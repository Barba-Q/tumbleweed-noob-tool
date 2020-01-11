#!/bin/bash
#
#   ########   #####   ###
#	XTERM AND ZENITY CHECK
####################################################
if which xterm >/dev/null; then
    echo debug: tnt xterm check ok
else   
    echo "Please install xterm manually (sudo zypper in xterm),\n it's necessary for this tool to work properly" && exit 0
fi

if which zenity >/dev/null; then
    echo zenity check ok
else
    echo "I have to install zenity first, please confirm your root password.\nIf you have trust issues in me, please install it manually and start me again" && sleep 1 && xterm -e "sudo zypper in -l -y zenity"
fi

#	MAIN MENU	
####################################################
ask=`zenity --list	\
--title="Tumbleweed Noob Tool - en"	\
--text="How can I be of service?"	\
--column=" "	\
"01 Install common software"	\
"02 Install tools and drivers"	\
"03 Recall software from previous installation " \
"04 Perform Software Upgrade" \
--width=600 --height=500`


# 	SELECTION 01 SOFTWARE	
####################################################
if [ "$ask" == "01 Install common software" ]; then
	software=$(zenity --list --checklist --width=600 --height=700 	\
	--title "Tumbleweed Noob Tool"	\
	--text " What do you want? Multiple selections possible"	\
	--column "" --column "Software" --column "Description"	\
		False Audacity "Editor for Audiofiles"	\
		False Blender "3D animation suite, Videoeditor"	\
		False Brasero "Simple CD Burning software"	\
		False Chromium "open source webbrowser"	\
		False Conky "Tool to add fancy desktop widgets" \
		False Discord "Voice-, Chattool"	\
		False Dosbox "MS-Dos emulator"	\
		False Kdenlive	"powerful non linear video editor"	\
		False OBS "Streaming- and screencapturing suite"	\
		False Opera   "Webbrowser" \
		False Pidgin "Multiprotocoll Chatclient"	\
		False ScummVM "Software to install and play classic point and click adventures" \
		False Steam "Gaming platform"	\
		False VLC "Mediaplayer - installs codecs"	\
		False Wine "Start software for MS Windows on Linux"	\
		False YoutubeDL "Downlod youtubevideos and playlists")

	
	#	COLLECT AND DEFINE SELECTION	
	####################################################
	
	
	if [[ $software = Audacity* ]]
	then {
	a="audacity"
	}
	fi
	
	if [[ $software = *Blender* ]]
	then {
	b="blender"
	}
	fi
	
	if [[ $software = *Brasero* ]]
	then {
	c="brasero"
	}
	fi
	
	if [[ $software = *Chromium* ]]
	then {
	d="chromium"
	}
	fi
	
	if [[ $software = *Discord* ]]
	then {
	e="discord"
	}
	fi
	
	if [[ $software = *Dosbox* ]]
	then {
	f="dosbox"
	}
	fi
	
	if [[ $software = *OBS* ]] 
	then {
	g="obs-studio"
	}
	fi
	
	if [[ $software = *Pidgin* ]]
	then {
	h="pidgin"
	}
	fi
	
	if [[ $software = *ScummVM* ]]
	then {
	i="scummvm"
	}
	fi
	
	if [[ $software = *Steam* ]] 
	then {
	j="steam glibc-locale-base-32bit"
	}
	fi
	
	if [[ $software = *VLC* ]]
	then {
	k="vlc vlc-codecs"
	}
	fi
	
	if [[ $software = *YoutubeDL* ]]
	then {
	l="youtube-dl"
	}
	fi
	
	if [[ $software = *Kdenlive* ]]
	then {
	m="kdenlive"
	}
	fi
	
	if [[ $software = *Opera* ]]
	then {
	n="opera"
	}
	fi
	
	if [[ $software = *Conky* ]]
	then {
	o="conky"
	}
	fi
	
	if
	[[ -z "$software" ]] 
	then
	zenity --info --width=450 --height=100 --text='Nothing selected, exiting.'
	exit 1
	fi
	
	#	CHECK PASSWORD AND PERFORM INSTALLATION		
	#	+ This will kill packagekit daemon if system is checking for updates whilst using this tool
	####################################################
	zenity --info --title='Off we go!' --width=450 --height=100 --text='You want me to apply all changes?' 
			xterm -e "sudo -S killall packagekitd;
			sudo -S killall y2start;
			sudo -S zypper --no-gpg-checks --non-interactive ar http://download.nvidia.com/opensuse/tumbleweed/  NVIDIA;
			sudo -S zypper --no-gpg-checks --non-interactive ar http://ftp.gwdg.de/pub/linux/packman/suse/openSUSE_Tumbleweed/ Multimedia;
			sudo -S zypper ref;
			sudo -S zypper in -l -y $a $b $c $d $e $f $g $h $i $j $k $l $m $n $o $p" 
                if 
                    [ $? -eq 1 ]
                    then {
                    zenity --info --width=450 --height=200 --text "Somethings wrong, is any other softwaremanager running?" && exit 0
                    }
                fi

		#	ERROR DETECTION AND QUIT
	####################################################
	if 
	[ $? -eq 0 ]
	then {
	zenity --info --width=450 --height=100 --text \
	"Seems like everything is done" 1>&2 && exit 0
	}
	else zenity --info --width=450 --height=100 --text \
	"Something went wrong. Please startover and try again." 1>&2 &&	exit 0
	fi
fi

# 	SELECTION 02 TOOLS		
####################################################
if [ "$ask" == "02 Install tools and drivers" ]; then
    tools=$(zenity --list --checklist --width=600 --height=500	\
	--title "Tumbleweed Noob Tool - en"	\
	--text " Install useful tools"	\
	--column "" --column "Software" --column "Description"	\
		False solaar "Handle Logitech dongles"	\
		False cups "Additional printer drivers"	\
		False codecs "Additional multimedia codecs"
		False msttfonts "Microsoft licensed fonts"	\
		False nvidia-gl04 "NVIDIA Driver for most cards"	\
		False nvidia-gl05 "NVIDIA Driver for latest cards (not available in this version. Add manually"	\
		False steam-controller "Steam-Controller support")
		
	
	#	COLLECT AND DEFINE SELECTION	
	####################################################
	if [[ $tools = solaar* ]]
	then {
	t_a="solaar"
	}
	fi
	
	if [[ $tools = *codecs* ]]
	then {
	t_b="libavcodec58 libavcodec57 lame speex xvidcore h264enc	\ 
	ffmpeg-4 ffx264 ffxvid gstreamer-plugins-bad gstreamer-plugins-good-extra	\
	gstreamer-plugins-libav"
	}
	fi
	
	if [[ $tools = *cups* ]]
	then {
	t_b="cups"
	}
	fi
	
	if [[ $tools = *msttfonts* ]]
	then {
	t_c="fetchmsttfonts"
	}
	fi
	
	if [[ $tools = *nvidia-gl04* ]]
	then {
	t_d="nvidia-glG04"
	}
	fi
	
#######NVIDIA GL05##################################
#	if [[ $tools = *nvidia-gl05* ]]
#	then {
#	t_e="nvidia-gl05"
#	}
#	fi
####################################################
	if [[ $tools = *steam-controller* ]]
	then {
	t_f="steam-controller"
	}
	fi
	
	if
	[[ -z "$tools" ]] 
	then
	zenity --info --width=450 --height=100 --text='Nothing selected, exiting.'
	exit 1
	fi


	#	CHECK PASSWORD AND PERFORM INSTALLATION
	#	+ This will kill packagekit daemon if system is checking for updates whilst using this tool
	####################################################
	zenity --info --title='Off we go!' --width=450 --height=100 --text='You want me to apply all changes?' 
			xterm -e "sudo -S killall packagekitd; 
            sudo -S killall y2start;
			sudo -S zypper --no-gpg-checks --non-interactive ar http://download.nvidia.com/opensuse/tumbleweed/  NVIDIA;
			sudo -S zypper --no-gpg-checks --non-interactive ar http://ftp.gwdg.de/pub/linux/packman/suse/openSUSE_Tumbleweed/ Multimedia;
			sudo -S zypper ref;
			sudo -S zypper in -l -y $t_a $t_b $t_c $t_d $t_e $t_f $t_g $t_h $t_i $t_j $t_k $t_l $t_m $t_n $t_o $t_p"
                if 
                    [ $? -eq 1 ]
                    then {
                    zenity --info --width=450 --height=200 --text "Somethings wrong with zypper, is any other softwaremanager running?" && exit 0
                    }
                fi
			

    #	ERROR DETECTION AND QUIT
	####################################################
	if 
	[ $? -eq 0 ]
	then {
	zenity --info --width=450 --height=100 --text "Seems like everything is done" 1>&2
	exit 0
	}
	else zenity --info --width=450 --height=100 --text "Something went wrong. Please startover and try again." 1>&2
	exit 0
	fi
fi

# BETA	SELECTION 03 SOFTWARE RESURRECTION	
####################################################
if [ "$ask" == "03 Recall software from previous installation " ]; then
		if [ -d $HOME/.config/discord ]; then
		r_a="discord" 		
		fi
		if [ -d $HOME/.config/chromium ]; then
		r_b="chromium" 		
		fi	
		if [ -d $HOME/.config/GIMP ]; then
		r_c="gimp"		
		fi
		if [ -d $HOME/.config/hexchat ]; then
		r_d="hexchat"		
		fi
		if [ -d $HOME/.config/Mumble ]; then
		r_e="mumble-client" 		
		fi
		if [ -d $HOME/.config/obs-studio ]; then
		r_f="obs-studio" 		
		fi
		if [ -d $HOME/.config/vlc ]; then
		r_g="vlc"		
		fi
		if [ -d $HOME/.config/youtube-dl ]; then
		r_h="youtube-dl" 		
		fi
		if [ -d $HOME/.local/share/kdenlive ]; then
		r_i="kdenlive" 		
		fi
		if [ -d $HOME/.local/share/Steam ]; then
		r_j="steam" 		
		fi
		if [ -d $HOME/.vbox/ ]; then
		r_k="virtualbox"		
		fi
		if [ -d $HOME/.wine/ ]; then
		r_l="wine"		
		fi
		# ADD MORE CONFIG FOLDERS HERE
#		if [ -d $HOME/.local/ ]; then
#		r_m="ADDSOFTWARE_m"		
#		fi
#		if [ -d $HOME/.config/ ]; then
#		r_n="ADDSOFTWARE_n"		
#		fi
#		if [ -d $HOME/.config/ ]; then
#		r_o="ADDSOFTWARE_o" 		
#		fi
#		if [ -d $HOME/.config/ ]; then
#		r_p="ADDSOFTWARE_p"		
#		fi
#		if [ -d $HOME/.config/ ]; then
#		r_q="ADDSOFTWARE_q"  		
#		fi
#		if [ -d $HOME/.config/ ]; then
#		r_r="ADDSOFTWARE_r"		
#		fi
#		if [ -d $HOME/.config/ ]; then
#		r_s="ADDSOFTWARE_s"	
#		fi
#		if [ -d $HOME/.config/ ]; then
#		r_t="ADDSOFTWARE_t"		
#		fi
#		if [ -d $HOME/.config/ ]; then
#		r_u="ADDSOFTWARE_u"		
#		fi
#		if [ -d $HOME/.config/ ]; then
#		r_v="ADDSOFTWARE_v"		
#		fi
#		if [ -d $HOME/.config/ ]; then
#		r_w="ADDSOFTWARE_w"		
#		fi
#		if [ -d $HOME/.config/ ]; then
#		r_x="ADDSOFTWARE_x"	
#		fi
#		if [ -d $HOME/.config/ ]; then
#		r_y="ADDSOFTWARE_y"		
#		fi	


	#	INSTALLATION
	####################################################
	zenity --info --title='Let me see..' --width=450 --height=100 --text='You want me to resurrect your stuff...\nat least what I can find?' 
			xterm -e "sudo -S killall packagekitd; 
			sudo -S zypper --no-gpg-checks --non-interactive ar http://download.nvidia.com/opensuse/tumbleweed/  NVIDIA;
			sudo -S zypper --no-gpg-checks --non-interactive ar http://ftp.gwdg.de/pub/linux/packman/suse/openSUSE_Tumbleweed/ Multimedia;
			sudo -S zypper ref;
			sudo -S zypper in -l -y $r_a $r_b $r_c $r_d $r_e $r_f $r_g $r_h $r_i $r_j $r_k $r_l $r_m $r_n $r_o $r_p "
                if 
                    [ $? -eq 1 ]
                    then {
                    zenity --info --width=450 --height=200 --text "Somethings wrong with zypper, is any other softwaremanager running?" && bash debug: tnt_08.sh && exit 0
                    }
                fi
			
					
	#	ERROR DETECTION AND QUIT
	####################################################
	if Seems like everything is done
	[ $? -eq 0 ]
	then {
	zenity --info --width=450 --height=100 --text "I found some stuff, like it was never gone ;)" 
	exit 0
	}
	zenity --info --width=450 --height=100 --text "Something went wrong. Please startover and try again." 1>&2
	exit 0
	fi
fi

#   SELECTION 04 SOFTWAREUPGRADE	
####################################################
if [ "$ask" == "04 Perform Software Upgrade" ]; then
	####################################################
	zenity --info --title='Let me see..' --width=450 --height=100 --text='You want me to upgrade your system?' 
			xterm -e "sudo -S killall packagekitd; 
			sudo -S zypper --no-gpg-checks --non-interactive ar http://download.nvidia.com/opensuse/tumbleweed/  NVIDIA;
			sudo -S zypper --no-gpg-checks --non-interactive ar http://ftp.gwdg.de/pub/linux/packman/suse/openSUSE_Tumbleweed/ Multimedia;
			sudo -S zypper ref;
			sudo -S zypper -n dup -l"
                if 
                    [ $? -eq 1 ]
                    then {
                    zenity --info --width=450 --height=200 --text "Somethings wrong with zypper, is any other softwaremanager running?" && bash debug: tnt_08.sh && exit 0
                    }
                fi
			
	#	ERROR DETECTION AND QUIT
	####################################################
	if 
	[ $? -eq 0 ]
	then {
	zenity --info --width=450 --height=100 --text "Seems like everything is done, now reboot and pray ;)" 
	exit 0
	}
	zenity --info --width=450 --height=100 --text "Something went wrong. Please startover and try again." 1>&2
	exit 0
	fi
fi
fi

