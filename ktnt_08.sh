#!/bin/bash
#
#   ########   #####   ###

#knietief's tumbleweed noob tool Version 0.8 (07.2019)
#
#Grafisches tool zum installieren gängiger und beliebter Software, sowie Tools zum verwenden zusätzlicher Hardware und NVIDIA Treiber
#
#Aus Sicherheitsgründen ist NVIDIA-gl05 noch nicht enthalten, da eine Parallelinstallation in dieser Version noch möglich ist und 
#das "könnte" tierisch in die Hose gehen. Safety first.
#
#Dieses script unterliegt keiner Lizenz und kann von jedem verwendet, erweitert und verteilt werden
#
#
#ACHTUNG
#Dieses script erfordert für seine Funktion root rechte!
#Falls du diese Datei nicht von knietief.com heruntergeladen hast, besteht die Gefahr das dieses script zu deinen Ungunsten manipuliert wurde
#Achte auch auf das Versionsdatum (s.o.), durch diese schnellebigen Änderungen in der Linuxwelt ist kaum zu erahnen wie viel dieses "Tool"
#in Zukunft kaputt zu machen könnte

#Anregungen und Wünsche entweder selber machen oder gerne auch an linux@knietief.com wenden.



#USAGE
#execute the script from filemanager (make sure it's executable)
#type $PATH/debug: tnt_08.sh into a terminal to start the script



#CHANGELOG
#0.8
# - Virtualbox and Wine added to recall
# - Xterm to observe installation progress
# - Opera and Conky added to software
#
#0.7
# - Systemupgrade (zypper dup) added
# - cleanup
#
#0.6
# - check for zypper is ready for installation
# - bug fixes :-*
#
#






#	SCRIPT START
####################################################



#	ZENITY VORHANDEN? SONST INSTALLIEREN
####################################################
if which xterm >/dev/null; then
    echo debug: tnt xterm check ok
else   
    notify-send "Bitte installiere xterm,\n dies ist nötig damit dieses script funktioniert" && exit 0
fi

if which zenity >/dev/null; then
    echo debug: tnt zenity check ok
else
    notify-send "Ich muss erst Zenity installieren" && sleep 1 && xterm -e "sudo zypper in -l -y zenity"
fi


#	LANGUAGE	
####################################################
echo debug: tnt startet sprachauswahl && ask_l=`zenity --list	\
--title="Tumbleweed Noob Tool"	\
--text="Select your language?"	\
--column=" "	\
"DE Deutsch"	\
"EN English"    \
--width=600 --height=500`



##DEUTSCH###########################################
if [ "$ask_l" == "DE Deutsch" ]; then
##DEUTSCH###########################################



#	HAUPTMENÜ	
####################################################
echo debug: tnt startet hauptmenü_de && ask=`zenity --list	\
--title="Suse Noob Tool - de"	\
--text="Was kann ich für dich tun?"	\
--column=" "	\
"01 Software installieren"	\
"02 Tools und Treiber installieren"	\
"03 Software nach neuinstallation wiederholen" \
"04 Softwareupgrade durchführen" \
--width=600 --height=500`



# 	AUSWAHL 01 SOFTWARE	
####################################################
if [ "$ask" == "01 Software installieren" ]; then
	echo debug: tnt softwareauswahl_de && software=$(zenity --list --checklist --width=600 --height=700 	\
	--title "Tumbleweed Noob Tool - de"	\
	--text " Was möchtest du installieren? Mehrfachselektion möglich"	\
	--column "" --column "Software" --column "Beschreibung"	\
		False Audacity "Bearbeitung von Audiodateien"	\
		False Blender "3D Animationstool, Videobearbeitung"	\
		False Brasero "Einfaches Brennprogramm"	\
		False Chromium "Internetbrowser, angepasst Version von Google's Chrome"	\
		False Conky "Desktop Widgets zur Anzeige von Systeninformationen z.B." \
		False Discord "Voice-, Chatprogramm"	\
		False Dosbox "MS Dos Emulator"	\
		False Kdenlive	"Nicht lineares Videoschnittprogramm"	\
		False OBS "Streamingtool für Livestreaming oder Bildschirmaufnahmen"	\
		False Opera   "Internetbrowser" \
		False Pidgin "Multiprotokoll Chatprogramm"	\
		False ScummVM "Software zum Spielen von klassischen point and click adventures" \
		False Steam "Spieleplattform"	\
		False VLC "Medienabspieler (enthält codecs)"	\
		False Wine "Verwenden von Windowsprogrammen unter Linux"	\
		False YoutubeDL "Herunterladen von Youtubevideos in diverse Formate")


	
	#	AUSWAHL SAMMELN UND SOFTWARE DEFINIEREN	
	####################################################
	
	
	if [[ $software = Audacity* ]]
	then {
	a="audacity"
	}
	else echo debug: tnt software exclude audacity
	fi
	
	
	
	
	if [[ $software = *Blender* ]]
	then {
	b="blender"
	}
	else echo debug: tnt software exclude blender
	fi
	
	
	
	
	if [[ $software = *Brasero* ]]
	then {
	c="brasero"
	}
	else echo debug: tnt software exclude brasero
	fi
	
	
	
	
	if [[ $software = *Chromium* ]]
	then {
	d="chromium"
	}
	else echo debug: tnt software exclude chromium
	fi
	
	
	
	
	if [[ $software = *Discord* ]]
	then {
	e="discord"
	}
	else echo debug: tnt software exclude discord
	fi
	
	
	
	
	if [[ $software = *Dosbox* ]]
	then {
	f="dosbox"
	}
	else echo debug: tnt software exclude dosbox
	fi
	
	
	
	
	if [[ $software = *OBS* ]] 
	then {
	g="obs-studio"
	}
	else echo debug: tnt software exclude obs-studio
	fi
	
	
	
	
	if [[ $software = *Pidgin* ]]
	then {
	h="pidgin"
	}
	else echo debug: tnt software exclude audacity
	fi
	
	
	
	
	if [[ $software = *ScummVM* ]]
	then {
	i="scummvm"
	}
	else echo debug: tnt software exclude scummvm
	fi
	
	
	
	
	if [[ $software = *Steam* ]] 
	then {
	j="steam"
	}
	else echo debug: tnt software exclude steam
	fi
	
	
	
	
	if [[ $software = *VLC* ]]
	then {
	k="vlc"
	}
	else echo debug: tnt software exclude vlc
	fi
	
	
	
	
	if [[ $software = *YoutubeDL* ]]
	then {
	l="youtube-dl"
	}
	else echo debug: tnt software exclude youtube-dl
	fi
	
	
	
	
	if [[ $software = *Kdenlive* ]]
	then {
	m="kdenlive"
	}
	else echo debug: tnt software exclude kdenlive
	fi
	
	
	
	
	if [[ $software = *Opera* ]]
	then {
	n="opera"
	}
	else echo debug: tnt software exclude opery
	fi
	
	
	
	
	if [[ $software = *Conky* ]]
	then {
	o="conky"
	}
	else echo debug: tnt software exclude conky
	fi

	
	
	
	
	
	
	
	if
	[[ -z "$software" ]] 
	then {
	echo debug: tnt software nothing selected && bash debug: tnt_08.sh && exit 0
	}
	fi
		

	
	#	PASSWORTABFRAGE UND INSTALLATION					
	####################################################
	PASSWORD=`zenity --title='Jetzt wirds ernst!' --width=450 --height=100 --hide-text --text='Du musst das Passwort gleich noch einaml eingeben, das ist so gewollt.\n\nRoot Passwort:' --entry`
		echo $PASSWORD | \
		
			sudo -S killall packagekitd 
			sudo -S killall y2start
			sudo -S zypper ar http://download.nvidia.com/opensuse/tumbleweed/  NVIDIATreiber			
			sudo -S zypper ar http://ftp.gwdg.de/pub/linux/packman/suse/openSUSE_Tumbleweed/ Multimedia
			sudo -S zypper ref
                if 
                    [ $? -eq 1 ]
                    then {
                    echo debug: tnt tools failed && zenity --info --width=450 --height=200 --text "Irgendwas stimmt mit Zypper nicht.\n Läuft noch ein anderer Softwaremanager?" && bash debug: tnt_08.sh && exit 0
                    }
                fi
            xterm -e "sudo -S zypper in -l -y $a $b $c $d $e $f $g $h $i $j $k $l $m $n $o $p "     
			
			
			
			
		#	FEHLERERKENNUNG	& ENDE
	####################################################
	if 
	[ $? -eq 0 ]
	then {
	zenity --info --width=450 --height=100 --text \
	"Scheint alles fertig zu sein." 1>&2 && exit 0
	}
	else echo debug: tnt error on install && zenity --info --width=450 --height=100 --text \
	"Da ist was schief gelaufen, hast du das richtige Passwort eingegeben?" 1>&2 &&	exit 0
	fi
fi


# 	AUSWAHL 02 TOOLS		
####################################################
if [ "$ask" == "02 Tools und Treiber installieren" ]; then
	echo debug: tnt tools gestartet && tools=$(zenity --list --checklist --width=600 --height=500	\
	--title "Tumbleweed Noob Tool - de"	\
	--text " Brauchbare Tools installieren"	\
	--column "" --column "Software" --column "Beschreibung"	\
		False solaar "Logitech Dongles verwalten"	\
		False cups "Zusätzliche Druckertreiber"	\
		False msttfonts "Microsoft Lizensierte Schriftarten"	\
		False nvidia-gl04 "NVIDIA Treiber für gängige Karten"	\
		False nvidia-gl05 "NVIDIA Treiber für aktuelle Karten (nocht nicht verfügbar)"	\
		False steam-controller "Steam Controller Unterstützung")
		

	
	#	AUSWAHL SAMMELN UND SOFTWARE DEFINIEREN	
	####################################################
	if [[ $tools = solaar* ]]
	then {
	t_a="solaar"
	}
	else echo debug: tnt tools exclude solaar
	fi
	
	
	
	
	if [[ $tools = *cups* ]]
	then {
	t_b="cups"
	}
	else echo debug: tnt tools exclude cups
	fi
	
	
	
	
	if [[ $tools = *msttfonts* ]]
	then {
	t_c="fetchmsttfonts"
	}
	else echo debug: tnt tools exclude msttfonts
	fi
	
	
	
	
	if [[ $tools = *nvidia-gl04* ]]
	then {
	t_d="nvidia-glG04"
	}
	else echo debug: tnt tools exclude nvidia_common
	fi
	
	
	
	
#######NVIDIA GL05##################################
#	if [[ $tools = *nvidia-gl05* ]]
#	then {
#	t_e="nvidia-gl05"
#	}
#	else echo snt tools exclude nvidia_edge
#	fi
####################################################
	if [[ $tools = *steam-controller* ]]
	then {
	t_f="steam-controller"
	}
	else echo debug: tnt tools exclude steamcontroller
	fi
	
	
	
	
	
	
	
	
	if
	[[ -z "$tools" ]] 
	then {
		echo debug: tnt software nothing selected && bash debug: tnt_08.sh && exit 0
	}
	fi	



	#	PASSWORTABFRAGE UND INSTALLATION
	#	+ Tötet packagekitd falls beim ausführen des scripts nach updates gesucht wird
	####################################################
	PASSWORD=`zenity --title='Jetzt wirds ernst!' --width=450 --height=100 --hide-text --text='Du musst das Passwort gleich noch einaml eingeben, das ist so gewollt.\n\nRoot Passwort:' --entry`
	echo $PASSWORD | \
			sudo -S killall packagekitd 
			sudo -S zypper ar http://download.nvidia.com/opensuse/tumbleweed/  NVIDIATreiber
			sudo -S zypper ar http://ftp.gwdg.de/pub/linux/packman/suse/openSUSE_Tumbleweed/ Multimedia
			sudo -S zypper ref
                if 
                    [ $? -eq 1 ]
                    then {
                    echo debug: tnt tools failed && zenity --info --width=450 --height=200 --text "Irgendwas stimmt mit Zypper nicht.\n Läuft noch ein anderer Softwaremanager?" && bash debug: tnt_08.sh && exit 0
                    }
                fi
			xterm -e "sudo -S zypper in -l -y $t_a $t_b $t_c $t_d $t_e $t_f $t_g $t_h $t_i $t_j $t_k $t_l $t_m $t_n $t_o $t_p"




	#	FEHLERERKENNUNG & ENDE
	####################################################
	if 
	[ $? -eq 0 ]
	then {
	echo debug: tnt tools success && zenity --info --width=450 --height=100 --text "Alles erledigt" 1>&2
	exit 0
	}
	else echo debug: tnt tools error on install && zenity --info --width=450 --height=100 --text "Da ist was schief gelaufen, hast du das richtige Passwort eingegeben?" 1>&2
	exit 0
	fi
fi


# BETA	AUSWAHL 03 WIEDERINSTALLATION	
####################################################
if [ "$ask" == "03 Software nach neuinstallation wiederholen" ]; then
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
# MEHR KRITERIEN HIER EINTRAGEN
		if [ -d $HOME/.vbox/ ]; then
		r_k="virtualbox"		
		fi
		if [ -d $HOME/.wine/ ]; then
		r_l="wine"		
		fi
#		if [ -d $HOME/.config/ ]; then
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
	PASSWORD=`zenity --title='Ich installiere was ich finden konnte' --hide-text --timeout=10 --text='Du musst das Passwort gleich noch einaml eingeben, das ist so gewollt.\n\nRoot Passwort:' --entry`
	echo $PASSWORD | \
			sudo -S killall packagekitd 
			sudo -S zypper ar http://download.nvidia.com/opensuse/tumbleweed/  NVIDIATreiber
			sudo -S zypper ar http://ftp.gwdg.de/pub/linux/packman/suse/openSUSE_Tumbleweed/ Multimedia
			sudo -S zypper ref
                if 
                    [ $? -eq 1 ]
                    then {
                    echo debug: tnt tools failed && zenity --info --width=450 --height=200 --text "Irgendwas stimmt mit Zypper nicht.\n Läuft noch ein anderer Softwaremanager?" && bash debug: tnt_08.sh && exit 0
                    }
                fi
			xterm -e "sudo -S zypper in -l -y $r_a $r_b $r_c $r_d $r_e $r_f $r_g $r_h $r_i $r_j $r_k $r_l $r_m $r_n $r_o $r_p "

					
	#	FEHLERERKENNUNG & ENDE
	####################################################
	if 
	[ $? -eq 0 ]
	then {
	echo debug: tnt tools success && zenity --info --width=450 --height=100 --text "Alles erledigt" 
	exit 0
	}
	else echo debug: tnt reinstall error on install && zenity --info --width=450 --height=100 --text "Da ist was schief gelaufen, hast du das richtige Passwort eingegeben?" 1>&2
	exit 0
	fi
fi


# BETA	AUSWAHL 04 SOFTWAREUPGRADE	
####################################################
if [ "$ask" == "04 Softwareupgrade durchführen" ]; then
	####################################################
	PASSWORD=`zenity --title='Softwareupgrade durchführen' --hide-text --text='Du musst das Passwort gleich noch einaml eingeben, das ist so gewollt.\n\nRoot Passwort:' --entry`
	echo $PASSWORD | \
			sudo -S killall packagekitd 
			sudo -S zypper ar http://download.nvidia.com/opensuse/tumbleweed/  NVIDIATreiber
			sudo -S zypper ar http://ftp.gwdg.de/pub/linux/packman/suse/openSUSE_Tumbleweed/ Multimedia
			sudo -S zypper ref
                if 
                    [ $? -eq 1 ]
                    then {
                    echo debug: tnt tools failed && zenity --info --width=450 --height=200 --text "Irgendwas stimmt mit Zypper nicht.\n Läuft noch ein anderer Softwaremanager?" && bash debug: tnt_08.sh && exit 0
                    }
                fi
			xterm -e "sudo -S zypper -n dup -l"

			
	#	FEHLERERKENNUNG & ENDE
	####################################################
	if 
	[ $? -eq 0 ]
	then {
	echo debug: tnt tools success && zenity --info --width=450 --height=100 --text "Alles erledigt" 
	exit 0
	}
	else echo debug: tnt reinstall error on install && zenity --info --width=450 --height=100 --text "Da ist was schief gelaufen, hast du das richtige Passwort eingegeben?" 1>&2
	exit 0
	fi
fi

fi


##ENGLISH###########################################
if [ "$ask_l" == "EN English" ]; then
##ENGLISH###########################################

#	MAIN MENU	
####################################################
echo debug: tnt startet && ask=`zenity --list	\
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
	echo debug: tnt software gestartet && software=$(zenity --list --checklist --width=600 --height=700 	\
	--title "Tumbleweed Noob Tool - de"	\
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


	
	#	AUSWAHL SAMMELN UND SOFTWARE DEFINIEREN	
	####################################################
	
	
	if [[ $software = Audacity* ]]
	then {
	a="audacity"
	}
	else echo debug: tnt software exclude audacity
	fi
	
	
	
	
	if [[ $software = *Blender* ]]
	then {
	b="blender"
	}
	else echo debug: tnt software exclude blender
	fi
	
	
	
	
	if [[ $software = *Brasero* ]]
	then {
	c="brasero"
	}
	else echo debug: tnt software exclude brasero
	fi
	
	
	
	
	if [[ $software = *Chromium* ]]
	then {
	d="chromium"
	}
	else echo debug: tnt software exclude chromium
	fi
	
	
	
	
	if [[ $software = *Discord* ]]
	then {
	e="discord"
	}
	else echo debug: tnt software exclude discord
	fi
	
	
	
	
	if [[ $software = *Dosbox* ]]
	then {
	f="dosbox"
	}
	else echo debug: tnt software exclude dosbox
	fi
	
	
	
	
	if [[ $software = *OBS* ]] 
	then {
	g="obs-studio"
	}
	else echo debug: tnt software exclude obs-studio
	fi
	
	
	
	
	if [[ $software = *Pidgin* ]]
	then {
	h="pidgin"
	}
	else echo debug: tnt software exclude audacity
	fi
	
	
	
	
	if [[ $software = *ScummVM* ]]
	then {
	i="scummvm"
	}
	else echo debug: tnt software exclude scummvm
	fi
	
	
	
	
	if [[ $software = *Steam* ]] 
	then {
	j="steam"
	}
	else echo debug: tnt software exclude steam
	fi
	
	
	
	
	if [[ $software = *VLC* ]]
	then {
	k="vlc"
	}
	else echo debug: tnt software exclude vlc
	fi
	
	
	
	
	if [[ $software = *YoutubeDL* ]]
	then {
	l="youtube-dl"
	}
	else echo debug: tnt software exclude youtube-dl
	fi
	
	
	
	
	if [[ $software = *Kdenlive* ]]
	then {
	m="kdenlive"
	}
	else echo debug: tnt software exclude kdenlive
	fi
	
	
	
	
	if [[ $software = *Opera* ]]
	then {
	n="opera"
	}
	else echo debug: tnt software exclude opery
	fi
	
	
	
	
	if [[ $software = *Conky* ]]
	then {
	o="conky"
	}
	else echo debug: tnt software exclude conky
	fi

	
	
	
	
	
	
	
	if
	[[ -z "$software" ]] 
	then {
	echo debug: tnt software nothing selected && bash debug: tnt_08.sh && exit 0
	}
	fi
		

	
	#	PASSWORTABFRAGE UND INSTALLATION					
	####################################################
	PASSWORD=`zenity --title='Off we go!' --width=450 --height=100 --hide-text --text='You have to reenter your password during the process, this is intended.\n\nRoot password:' --entry`
		echo $PASSWORD | \
		
			sudo -S killall packagekitd 
			sudo -S killall y2start
			sudo -S zypper ar http://download.nvidia.com/opensuse/tumbleweed/  NVIDIATreiber			
			sudo -S zypper ar http://ftp.gwdg.de/pub/linux/packman/suse/openSUSE_Tumbleweed/ Multimedia
			sudo -S zypper ref
                if 
                    [ $? -eq 1 ]
                    then {
                    echo debug: tnt tools failed && zenity --info --width=450 --height=200 --text "Somethings wrong with zypper, is any other softwaremanager running?" && bash debug: tnt_08.sh && exit 0
                    }
                fi
            xterm -e "sudo -S zypper in -l -y $a $b $c $d $e $f $g $h $i $j $k $l $m $n $o $p "     
			
			
			
			
		#	FEHLERERKENNUNG	& ENDE
	####################################################
	if 
	[ $? -eq 0 ]
	then {
	zenity --info --width=450 --height=100 --text \
	"Seems like everything is done" 1>&2 && exit 0
	}
	else echo debug: tnt error on install && zenity --info --width=450 --height=100 --text \
	"Something went wrong. Please startover and try again." 1>&2 &&	exit 0
	fi
fi


# 	AUSWAHL 02 TOOLS		
####################################################
if [ "$ask" == "02 Install tools and drivers" ]; then
	echo debug: tnt tools gestartet && tools=$(zenity --list --checklist --width=600 --height=500	\
	--title "Tumbleweed Noob Tool - en"	\
	--text " Install useful tools"	\
	--column "" --column "Software" --column "Description"	\
		False solaar "Handle Logitech dongles"	\
		False cups "Additional printer drivers"	\
		False msttfonts "Microsoft licensed fonts"	\
		False nvidia-gl04 "NVIDIA Driver for most cards"	\
		False nvidia-gl05 "NVIDIA Driver for latest cards (not available in this version. Add manually"	\
		False steam-controller "Steam-Controller support")
		

	
	#	AUSWAHL SAMMELN UND SOFTWARE DEFINIEREN	
	####################################################
	if [[ $tools = solaar* ]]
	then {
	t_a="solaar"
	}
	else echo debug: tnt tools exclude solaar
	fi
	
	
	
	
	if [[ $tools = *cups* ]]
	then {
	t_b="cups"
	}
	else echo debug: tnt tools exclude cups
	fi
	
	
	
	
	if [[ $tools = *msttfonts* ]]
	then {
	t_c="fetchmsttfonts"
	}
	else echo debug: tnt tools exclude msttfonts
	fi
	
	
	
	
	if [[ $tools = *nvidia-gl04* ]]
	then {
	t_d="nvidia-glG04"
	}
	else echo debug: tnt tools exclude nvidia_common
	fi
	
	
	
	
#######NVIDIA GL05##################################
#	if [[ $tools = *nvidia-gl05* ]]
#	then {
#	t_e="nvidia-gl05"
#	}
#	else echo snt tools exclude nvidia_edge
#	fi
####################################################
	if [[ $tools = *steam-controller* ]]
	then {
	t_f="steam-controller"
	}
	else echo debug: tnt tools exclude steamcontroller
	fi
	
	
	
	
	
	
	
	
	if
	[[ -z "$tools" ]] 
	then {
		echo debug: tnt software nothing selected && bash debug: tnt_08.sh && exit 0
	}
	fi	



	#	PASSWORTABFRAGE UND INSTALLATION
	#	+ Tötet packagekitd falls beim ausführen des scripts nach updates gesucht wird
	####################################################
	PASSWORD=`zenity --title='Off we go!' --width=450 --height=100 --hide-text --text='You have to reenter your password during the process, this is intended.\n\nRoot password:' --entry`
	echo $PASSWORD | \
			sudo -S killall packagekitd 
			sudo -S zypper ar http://download.nvidia.com/opensuse/tumbleweed/  NVIDIATreiber
			sudo -S zypper ar http://ftp.gwdg.de/pub/linux/packman/suse/openSUSE_Tumbleweed/ Multimedia
			sudo -S zypper ref
                if 
                    [ $? -eq 1 ]
                    then {
                    echo debug: tnt tools failed && zenity --info --width=450 --height=200 --text "Somethings wrong with zypper, is any other softwaremanager running?" && bash debug: tnt_08.sh && exit 0
                    }
                fi
			xterm -e "sudo -S zypper in -l -y $t_a $t_b $t_c $t_d $t_e $t_f $t_g $t_h $t_i $t_j $t_k $t_l $t_m $t_n $t_o $t_p"




	#	FEHLERERKENNUNG & ENDE
	####################################################
	if 
	[ $? -eq 0 ]
	then {
	echo debug: tnt tools success && zenity --info --width=450 --height=100 --text "Seems like everything is done" 1>&2
	exit 0
	}
	else echo debug: tnt tools error on install && zenity --info --width=450 --height=100 --text "Something went wrong. Please startover and try again." 1>&2
	exit 0
	fi
fi


# BETA	AUSWAHL 03 WIEDERINSTALLATION	
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
# MEHR KRITERIEN HIER EINTRAGEN
		if [ -d $HOME/.vbox/ ]; then
		r_k="virtualbox"		
		fi
		if [ -d $HOME/.wine/ ]; then
		r_l="wine"		
		fi
#		if [ -d $HOME/.config/ ]; then
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
	PASSWORD=`zenity --title='I install what I could find' --hide-text --timeout=10 --text='You have to reenter your password during the process, this is intended.\n\nRoot password:' --entry`
	echo $PASSWORD | \
			sudo -S killall packagekitd 
			sudo -S zypper ar http://download.nvidia.com/opensuse/tumbleweed/  NVIDIATreiber
			sudo -S zypper ar http://ftp.gwdg.de/pub/linux/packman/suse/openSUSE_Tumbleweed/ Multimedia
			sudo -S zypper ref
                if 
                    [ $? -eq 1 ]
                    then {
                    echo debug: tnt tools failed && zenity --info --width=450 --height=200 --text "Somethings wrong with zypper, is any other softwaremanager running?" && bash debug: tnt_08.sh && exit 0
                    }
                fi
			xterm -e "sudo -S zypper in -l -y $r_a $r_b $r_c $r_d $r_e $r_f $r_g $r_h $r_i $r_j $r_k $r_l $r_m $r_n $r_o $r_p "

					
	#	FEHLERERKENNUNG & ENDE
	####################################################
	if 
	[ $? -eq 0 ]
	then {
	echo debug: tnt tools success && zenity --info --width=450 --height=100 --text "Seems like everything is done" 
	exit 0
	}
	else echo debug: tnt reinstall error on install && zenity --info --width=450 --height=100 --text "Something went wrong. Please startover and try again." 1>&2
	exit 0
	fi
fi


# BETA	AUSWAHL 04 SOFTWAREUPGRADE	
####################################################
if [ "$ask" == "04 Perform Software Upgrade" ]; then
	####################################################
	PASSWORD=`zenity --title='Perform software spgrade' --hide-text --text='You have to reenter your password during the process, this is intended.\n\nRoot password:' --entry`
	echo $PASSWORD | \
			sudo -S killall packagekitd 
			sudo -S zypper ar http://download.nvidia.com/opensuse/tumbleweed/  NVIDIATreiber
			sudo -S zypper ar http://ftp.gwdg.de/pub/linux/packman/suse/openSUSE_Tumbleweed/ Multimedia
			sudo -S zypper ref
                if 
                    [ $? -eq 1 ]
                    then {
                    echo debug: tnt tools failed && zenity --info --width=450 --height=200 --text "Somethings wrong with zypper, is any other softwaremanager running?" && bash debug: tnt_08.sh && exit 0
                    }
                fi
			xterm -e "sudo -S zypper -n dup -l"

			
	#	FEHLERERKENNUNG & ENDE
	####################################################
	if 
	[ $? -eq 0 ]
	then {
	echo debug: tnt tools success && zenity --info --width=450 --height=100 --text "Seems like everything is done" 
	exit 0
	}
	else echo debug: tnt reinstall error on install && zenity --info --width=450 --height=100 --text "Something went wrong. Please startover and try again." 1>&2
	exit 0
	fi
fi
fi

