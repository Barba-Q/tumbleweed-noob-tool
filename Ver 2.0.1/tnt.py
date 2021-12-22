#Tumbleweed Noob Tool 2.0.1
#This mess is written in python 3.9 by Ingo Nölleke in 2021 with kate

'''TODO:
- Software ressurection
- Auto setup

Optimizations:
 - make window placing a seperate function
 - write checkbox selections directly to alist
 - detect any error in subcommand
'''



import tkinter as tk
import subprocess                                       #to call bash commands
from tkinter import *                                   #I really don't know if this is necessary
from tkinter.ttk import *                               #to show fancy icons
from tkinter import messagebox                          #to show, you guessed it, a message box
from tkinter.messagebox import askokcancel, showinfo, WARNING  #display warnings and stuff to dismiss with a single click


mainwindow = tk.Tk(className = ">Tumbleweed Noob Tool<")        #This ist the inits the mainwindow an the titlename

#global vars
softwarewindow_checkbox_1_selected  = tk.IntVar()
softwarewindow_checkbox_2_selected  = tk.IntVar()
softwarewindow_checkbox_3_selected  = tk.IntVar()
softwarewindow_checkbox_4_selected  = tk.IntVar()
softwarewindow_checkbox_5_selected  = tk.IntVar()
softwarewindow_checkbox_6_selected  = tk.IntVar()
softwarewindow_checkbox_7_selected  = tk.IntVar()
softwarewindow_checkbox_8_selected  = tk.IntVar()
softwarewindow_checkbox_9_selected  = tk.IntVar()
softwarewindow_checkbox_10_selected = tk.IntVar()
softwarewindow_checkbox_11_selected = tk.IntVar()
softwarewindow_checkbox_12_selected = tk.IntVar()

toolswindow_checkbox_1_selected     = tk.IntVar()
toolswindow_checkbox_2_selected     = tk.IntVar()
toolswindow_checkbox_3_selected     = tk.IntVar()
toolswindow_checkbox_4_selected     = tk.IntVar()
toolswindow_checkbox_5_selected     = tk.IntVar()
toolswindow_checkbox_6_selected     = tk.IntVar()
toolswindow_checkbox_7_selected     = tk.IntVar()
toolswindow_checkbox_8_selected     = tk.IntVar()




#############################################################################
#                            Mainwindow
#############################################################################

def Mainwindow():
    global mainwindow
    setpadx = 10
    setpady = 30
# get window size
    windowWidth = mainwindow.winfo_reqwidth()
    windowHeight = mainwindow.winfo_reqheight()
# get both half the screen width/height and window width/height
    positionRight = int(mainwindow.winfo_screenwidth()/3 - windowWidth/2)
    positionDown = int(mainwindow.winfo_screenheight()/3 - windowHeight/2)
# position the window in the center of the page.
    mainwindow.geometry("+{}+{}".format(positionRight, positionDown))
# set windowgrid
    mainwindow.rowconfigure([0, 1, 2], minsize=60, weight=2)
    mainwindow.columnconfigure([0, 1, 2], minsize=200, weight=2)
# place widgets
    label_img = PhotoImage(file = "files/label.png")
    label_1 = tk.Label(mainwindow,
                       pady=setpady, padx=setpadx,
                       text = "Welcome... how can I help?\n\n\n\n",
                       image = label_img,
                       compound = TOP)
    label_1.grid(row = 0, column = 1,  columnspan = 1, sticky = "nsew")
    label_1.image = label_img

    software_img = PhotoImage(file = "files/software.png")
    button_1 = tk.Button(mainwindow,
                         pady=setpady, padx=setpadx,
                         text = "Software",
                         image = software_img,
                         compound = TOP,
                         command = Call_softwarewindow,
                         relief = FLAT)
    button_1.image = software_img
    button_1.grid(row = 1, column = 0, sticky = "nsew")

    tools_img = PhotoImage(file = "files/tools.png")
    button_2 = tk.Button(mainwindow,
                         pady=setpady, padx=setpadx,
                         text = "Tools",
                         image = tools_img,
                         compound = TOP,
                         command = Call_toolswindow,
                         relief = FLAT)
    button_2.image = tools_img
    button_2.grid(row = 1, column = 1, sticky = "nsew")

    update_img = PhotoImage(file = "files/update.png")
    button_3 = tk.Button(mainwindow,
                         pady=setpady,
                         padx=setpadx,
                         image = update_img,
                         text = "Update",
                         compound = TOP,
                         command = Call_update,
                         relief = FLAT)
    button_3.image = update_img
    button_3.grid(row = 1, column = 2, sticky = "nsew")

    restore_img = PhotoImage(file = "files/restore.png")
    button_4 = tk.Button(mainwindow,
                         pady=setpady,
                         padx=setpadx,
                         text = "Restore",
                         image = restore_img,
                         compound = TOP,
                         command = Call_restore,
                         relief = FLAT)
    button_4.image = restore_img
    button_4.grid(row = 2, column = 0, sticky = "nsew")

    automatic_img = PhotoImage(file = "files/automatic.png")
    button_5 = tk.Button(mainwindow,
                         pady=setpady,
                         padx=setpadx,
                         text = "Auto Setup",
                         image = automatic_img,
                         compound = TOP,
                         command = Call_autosetup,
                         relief = FLAT)
    button_5.image = automatic_img
    button_5.grid(row = 2, column = 1, sticky = "nsew")

    quit_img = PhotoImage(file = "files/quit.png")
    button_6 = tk.Button(mainwindow,
                         pady=setpady, padx=setpadx,
                         text = "Quit",
                         image = quit_img,
                         compound = TOP,
                         command = Call_quit,
                         relief = FLAT)
    button_6.image = quit_img
    button_6.grid(row = 2, column = 2, sticky = "nsew")

def Call_update():
    confirm_update = askokcancel(title="Attention",
    message="\nThe System will be upgraded.\nPlease provide your root password\n    \n")
    if confirm_update == 1:
        process = subprocess.call(['bash', 'bash/upgrade.sh'], stdout=subprocess.PIPE)
    else:
        tk.messagebox.showinfo(title="Aborted", message="\nUpgrade aborted   \n")

def Call_restore():
    tk.messagebox.showinfo(title="Sorry :(", message="\nThis function is not implemented yet    \n")

def Call_autosetup():
    tk.messagebox.showinfo(title="Sorry :(", message="\nThis function is not implemented yet    \n")

def Call_quit():
    mainwindow.destroy()

#############################################################################
#                            Softwarewindow
#############################################################################

def Call_softwarewindow():
    softwarewindow = tk.Toplevel(mainwindow)
    software_img = PhotoImage(file = "files/software.png")

# get window size
    windowWidth = softwarewindow.winfo_reqwidth()
    windowHeight = softwarewindow.winfo_reqheight()
# get both half the screen width/height and window width/height
    positionRight = int(softwarewindow.winfo_screenwidth()/3 - windowWidth/2)
    positionDown = int(softwarewindow.winfo_screenheight()/3 - windowHeight/2)
# position the window in the center of the page.
    softwarewindow.geometry("+{}+{}".format(positionRight, positionDown))

#def internal vars for central adjustments
    setpady = 15
    setpadx = 40
    setbg = "grey"
    setbd = "0"

#windowsize and grid
    softwarewindow.rowconfigure([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], minsize=30, weight=1)
    softwarewindow.columnconfigure([0, 1, 2, 4], minsize=100, weight=2)

    softwarewindow_checkbox_1 = tk.Checkbutton(softwarewindow,
                                       pady=setpady, padx=setpadx,
                                       text = "Audacity",
                                       selectcolor = setbg,
                                       variable = softwarewindow_checkbox_1_selected,
                                       onvalue=1, offvalue=0
                                       ).grid(row = 3, column = 1, sticky="nw")
    softwarewindow_checkbox_2 = tk.Checkbutton(softwarewindow,
                                       text = "Blender",
                                       selectcolor = setbg,
                                       pady=setpady, padx=setpadx,
                                       variable = softwarewindow_checkbox_2_selected,
                                       onvalue=1, offvalue=0
                                       ).grid(row = 4, column = 1, sticky="nw")
    softwarewindow_checkbox_3 = tk.Checkbutton(softwarewindow,
                                       text = "Google Chrome",
                                       selectcolor = setbg,
                                       pady=setpady, padx=setpadx,
                                       variable = softwarewindow_checkbox_3_selected,
                                       onvalue=1, offvalue=0
                                       ).grid(row = 5, column = 1, sticky="nw")
    softwarewindow_checkbox_4 = tk.Checkbutton(softwarewindow,
                                       text = "Discord",
                                       selectcolor = setbg,
                                       pady=setpady, padx=setpadx,
                                       variable = softwarewindow_checkbox_4_selected,
                                       onvalue=1, offvalue=0
                                       ).grid(row = 6, column = 1, sticky="nw")
    softwarewindow_checkbox_5 = tk.Checkbutton(softwarewindow,
                                       text = "Kdenlive",
                                       selectcolor = setbg,
                                       pady=setpady, padx=setpadx,
                                       variable = softwarewindow_checkbox_5_selected,
                                       onvalue=1, offvalue=0
                                       ).grid(row = 7, column = 1, sticky="nw")
    softwarewindow_checkbox_6 = tk.Checkbutton(softwarewindow,
                                       text = "OBS",
                                       selectcolor = setbg,
                                       pady=setpady, padx=setpadx,
                                       variable = softwarewindow_checkbox_6_selected,
                                       onvalue=1, offvalue=0
                                       ).grid(row = 8, column = 1, sticky="nw")
    softwarewindow_checkbox_7 = tk.Checkbutton(softwarewindow,
                                       text = "ScummVM",
                                       selectcolor = setbg,
                                       pady=setpady, padx=setpadx,
                                       variable = softwarewindow_checkbox_7_selected,
                                       onvalue=1, offvalue=0
                                       ).grid(row = 3, column = 2, sticky="nw")
    softwarewindow_checkbox_8 = tk.Checkbutton(softwarewindow,
                                       text = "Steam",
                                       selectcolor = setbg,
                                       pady=setpady, padx=setpadx,
                                       variable = softwarewindow_checkbox_8_selected,
                                       onvalue=1, offvalue=0
                                       ).grid(row = 4, column = 2, sticky="nw")
    softwarewindow_checkbox_9 = tk.Checkbutton(softwarewindow,
                                       text = "VLC",
                                       selectcolor = setbg,
                                       pady=setpady, padx=setpadx,
                                       variable = softwarewindow_checkbox_9_selected,
                                       onvalue=1, offvalue=0
                                       ).grid(row = 5, column = 2, sticky="nw")
    softwarewindow_checkbox_10 = tk.Checkbutton(softwarewindow,
                                       text = "Wine",
                                       selectcolor = setbg,
                                       pady=setpady, padx=setpadx,
                                       variable = softwarewindow_checkbox_10_selected,
                                       onvalue=1, offvalue=0
                                       ).grid(row = 6, column = 2, sticky="nw")
    softwarewindow_checkbox_11 = tk.Checkbutton(softwarewindow,
                                       text = "Youtube DL",
                                       selectcolor = setbg,
                                       pady=setpady, padx=setpadx,
                                       variable = softwarewindow_checkbox_11_selected,
                                       onvalue=1, offvalue=0
                                       ).grid(row = 7, column = 2, sticky="nw")
    softwarewindow_checkbox_12 = tk.Checkbutton(softwarewindow,
                                       text = "Debugmode",
                                       selectcolor = setbg,
                                       pady=setpady, padx=setpadx,
                                       variable = softwarewindow_checkbox_12_selected,
                                       onvalue=1, offvalue=0
                                       ).grid(row = 9, column = 1, sticky="w")

    softwarewindow_label_1 = tk.Label(softwarewindow,
                                      image = software_img,
                                      compound = TOP,
                                      text= "Choose software to install:")
    softwarewindow_label_1.image = software_img
    softwarewindow_label_1.grid(row=1, column=1, columnspan=2, sticky="nsew")

    softwarewindow_button_1 = tk.Button(softwarewindow,
                                  text= "OK",
                                  command = lambda:[softwarewindow.destroy(), Call_softwarewindow_ok_pressed()]
                                  ).grid(row=10, column=1, sticky="nsew")

    softwarewindow_button_2 = tk.Button(softwarewindow,
                                  text= "Cancel",
                                  command = softwarewindow.destroy
                                  ).grid(row=10, column=2, sticky="nsew")

#Things that happen when OK button is clicked from the softwareselectionwindow
def Call_softwarewindow_ok_pressed():
    #variables
    confirm_softwareinstall = askokcancel(title="Attention",
    message="\nThe selected packages will be installed. Please provide your root password\n    \n")

    #get information wich checkboxes are ticked
    softwarelist =[softwarewindow_checkbox_1_selected.get(),
                   softwarewindow_checkbox_2_selected.get(),
                   softwarewindow_checkbox_3_selected.get(),
                   softwarewindow_checkbox_4_selected.get(),
                   softwarewindow_checkbox_5_selected.get(),
                   softwarewindow_checkbox_6_selected.get(),
                   softwarewindow_checkbox_7_selected.get(),
                   softwarewindow_checkbox_8_selected.get(),
                   softwarewindow_checkbox_9_selected.get(),
                   softwarewindow_checkbox_10_selected.get(),
                   softwarewindow_checkbox_11_selected.get(),
                   softwarewindow_checkbox_12_selected.get()
                   ]
    print("info: listoutput:", softwarelist)

    #check if theres at least 1 checkbox selected to call the installation
    if softwarelist[:]      == [0] * 12:
    #'''This Value needs to be changed    ^^ when software is added or removed - this needs some optimization'''
        goforsoftware = 0
        print("info: nothing selected")
    else:
        goforsoftware = 1

    #translate checkboxselections to usable terms for the installer
    if softwarelist[0] == 1 and goforsoftware == 1:
        audacity_1 = "audacity"
        print("info:", audacity_1, "selected")
    else:
        audacity_1 = ""

    if softwarelist[1] == 1 and goforsoftware == 1:
        blender_1 = "blender"
        print("info:", blender_1, "selected")
    else:
        blender_1 = ""

    if softwarelist[2] == 1 and goforsoftware == 1:
        chrome_1 = "Google Chrome"
    #additional line given to the bashscript to add google repository
        chrome_2 = "sudo -S zypper --no-gpg-checks --non-interactive ar http://dl.google.com/linux/chrome/rpm/stable/x86_64 Google-Chrome"
        print("info:", chrome_1, "selected")
    else:
        chrome_1 = ""
        chrome_2 = ""

    if softwarelist[3] == 1 and goforsoftware == 1:
        discord_1 = "Discord"
        print("info:", discord_1, "selected")
    else:
        discord = ""

    if softwarelist[4] == 1 and goforsoftware == 1:
        kdenlive_1 = "kdenlive"
        print("info:", kdenlive_1, "selected")
    else:
        kdenlive_1 = ""

    if softwarelist[5] == 1 and goforsoftware == 1:
        obs_1 = "obs-studio"
        print("info:", obs_1, "selected")
    else:
        obs_1 = ""

    if softwarelist[6] == 1 and goforsoftware == 1:
        scumm_1 = "scummvm"
        print("info:", scumm_1, "selected")
    else:
        scumm_1 = ""

    if softwarelist[7] == 1 and goforsoftware == 1:
        steam_1 = "steam"
        print("info:", steam_1, "selected")
    else:
        steam_1 = ""

    if softwarelist[8] == 1 and goforsoftware == 1:
        vlc_1 = "vlc"
        print("info:", vlc_1, "selected")
    else:
        vlc_1 = ""

    if softwarelist[9] == 1 and goforsoftware == 1:
        wine_1 = "wine"
        print("info:", wine_1, "selected")
    else:
        wine_1 = ""

    if softwarelist[10] == 1 and goforsoftware == 1:
        youtube_1 = "youtube-dl"
        print("info:", youtube_1, "selected")
    else:
        youtube_1 = ""

    if softwarelist[11] == 1 and goforsoftware == 1:
        hold = "-hold"
        print("info: keep Terminalwindow open when done" )
    else:
        hold = ""

    #perform installation
    if goforsoftware == 1 and confirm_softwareinstall == 1:
        process = subprocess.call(['bash', 'bash/software.sh', str(hold), str(chrome_2), str(audacity_1), str(blender_1), str(chrome_1), str(discord), str(kdenlive_1), str(obs_1), str(scumm_1), str(steam_1), str(vlc_1), str(wine_1), str(youtube_1)], stdout=subprocess.PIPE)
    #message if terminal closes without error
        tk.messagebox.showinfo(title="Done", message="\nSeems like everything is done    \n")
        print("seems like everything is done")
    else:
    #message if terminal closes with error
        tk.messagebox.showinfo(title="Warning", message="\nInstallation aborted    \n")
        print("Info: installation cancelled")



#############################################################################
#                            Toolswindow
#############################################################################

def Call_toolswindow():
    toolswindow = tk.Toplevel(mainwindow)
    tools_img = PhotoImage(file = "files/tools.png")

# Maße des Fensters ermitteln
    windowWidth = toolswindow.winfo_reqwidth()
    windowHeight = toolswindow.winfo_reqheight()
# Bildschirmgröße ermitteln
    positionRight = int(toolswindow.winfo_screenwidth()/3 - windowWidth/2)
    positionDown = int(toolswindow.winfo_screenheight()/3 - windowHeight/2)
# Fenster positionieren
    toolswindow.geometry("+{}+{}".format(positionRight, positionDown))

    setpady = 15
    setpadx = 40
    setbg = "grey"
    setbd = "0"



    toolswindow.rowconfigure([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], minsize=30, weight=1)
    toolswindow.columnconfigure([0, 1, 2, 4], minsize=100, weight=2)



    toolswindow_checkbox_1 = tk.Checkbutton(toolswindow,
                                       text = "Addidtional printer drivers",
                                       selectcolor = setbg,
                                       pady=setpady, padx=setpadx,
                                       variable = toolswindow_checkbox_1_selected,
                                       onvalue=1, offvalue=0
                                       ).grid(row = 3, column = 1, sticky="nw")
    toolswindow_checkbox_2 = tk.Checkbutton(toolswindow,
                                       text = "Multimedia Codecs",
                                       selectcolor = setbg,
                                       pady=setpady, padx=setpadx,
                                       variable = toolswindow_checkbox_2_selected,
                                       onvalue=1, offvalue=0
                                       ).grid(row = 4, column = 1, sticky="nw")
    toolswindow_checkbox_3 = tk.Checkbutton(toolswindow,
                                       text = "Microsoft Fonts (Arial etc.)",
                                       selectcolor = setbg,
                                       pady=setpady, padx=setpadx,
                                       variable = toolswindow_checkbox_3_selected,
                                       onvalue=1, offvalue=0
                                       ).grid(row = 5, column = 1, sticky="nw")
    toolswindow_checkbox_4 = tk.Checkbutton(toolswindow,
                                       text = "Logitech Hardwaremanager",
                                       selectcolor = setbg,
                                       pady=setpady, padx=setpadx,
                                       variable = toolswindow_checkbox_4_selected,
                                       onvalue=1, offvalue=0
                                       ).grid(row = 6, column = 1, sticky="nw")
    toolswindow_checkbox_5 = tk.Checkbutton(toolswindow,
                                       text = "NVIDIA Driver for most cards",
                                       selectcolor = setbg,
                                       pady=setpady, padx=setpadx,
                                       variable = toolswindow_checkbox_5_selected,
                                       onvalue=1, offvalue=0
                                       ).grid(row = 3, column = 2, sticky="nw")
    toolswindow_checkbox_6 = tk.Checkbutton(toolswindow,
                                       text = "NVIDIA Driver for newer cards",
                                       selectcolor = setbg,
                                       pady=setpady, padx=setpadx,
                                       variable = toolswindow_checkbox_6_selected,
                                       onvalue=1, offvalue=0
                                       ).grid(row = 4, column = 2, sticky="nw")
    toolswindow_checkbox_7 = tk.Checkbutton(toolswindow,
                                       text = "Steam Controller Support",
                                       selectcolor = setbg,
                                       pady=setpady, padx=setpadx,
                                       variable = toolswindow_checkbox_7_selected,
                                       onvalue=1, offvalue=0
                                       ).grid(row = 5, column = 2, sticky="nw")
    toolswindow_checkbox_8 = tk.Checkbutton(toolswindow,
                                       text = "Debugmode",
                                       selectcolor = setbg,
                                       pady=setpady, padx=setpadx,
                                       variable = toolswindow_checkbox_8_selected,
                                       onvalue=1, offvalue=0
                                       ).grid(row = 7, column = 1, sticky="w")

    toolswindow_label_1 = tk.Label(toolswindow,
                                      image = tools_img,
                                      compound = TOP,
                                      text= "Choose tools to install:")
    toolswindow_label_1.image = tools_img
    toolswindow_label_1.grid(row=1, column=1, columnspan=2, sticky="nsew")

    toolswindow_button_1 = tk.Button(toolswindow,
                                  text= "OK",
                                  command = lambda:[toolswindow.destroy(), Call_toolswindow_ok_pressed()]
                                  ).grid(row=10, column=1, sticky="nsew")

    toolswindow_button_2 = tk.Button(toolswindow,
                                  text= "Cancel",
                                  command = toolswindow.destroy
                                  ).grid(row=10, column=2, sticky="nsew")

def Call_toolswindow_ok_pressed():
    #variables

    #get information wich checkboxes are ticked
    toolslist =[toolswindow_checkbox_1_selected.get(),
                   toolswindow_checkbox_2_selected.get(),
                   toolswindow_checkbox_3_selected.get(),
                   toolswindow_checkbox_4_selected.get(),
                   toolswindow_checkbox_5_selected.get(),
                   toolswindow_checkbox_6_selected.get(),
                   toolswindow_checkbox_7_selected.get(),
                   toolswindow_checkbox_8_selected.get()
                   ]
    print("info: listoutput:", toolslist)

    #check if theres at least 1 checkbox selected to call the installation
    if toolslist[:]      == [0] * 12:
    #'''This Value needs to be changed    ^^ when software is added or removed - this needs some optimization'''
        gofortools = 0
        print("info: nothing selected")
    else:
        gofortools = 1

    #translate checkboxselections to usable terms for the installer
    if toolslist[0] == 1 and gofortools == 1:
        cups_1 = "cups"
        print("info:", cups, "selected")
    else:
        cups_1 = ""

    if toolslist[1] == 1 and gofortools == 1:
        codecs_1 = "libavcodec57 lame libxvidcore4 h264enc ffmpeg-4 gstreamer-plugins-bad gstreamer-plugins-bad-orig-addon gstreamer-plugins-good-extra gstreamer-plugins-libav gstreamer-plugins-ugly"
        print("info:", codecs_1, "selected")
    else:
        blender_1 = ""

    if toolslist[2] == 1 and gofortools == 1:
        fonts_1 = "fetchmsttfonts"
        print("info:", fonts_1, "selected")
    else:
        fonts_1 = ""

    if toolslist[3] == 1 and gofortools == 1:
        solaar_1 = "solaar"
        print("info:", solaar_1, "selected")
    else:
        solaar_1 = ""

    if toolslist[4] == 1 and gofortools == 1 :
        nvidia_1 = "nvidia-glG04"
        print("info:", nvidia_1, "selected")
    else:
        nvidia_1 = ""
        doubleselection = 0


    if toolslist[5] == 1 and toolslist[4] == 1:
        nvidia_2 = ""
        nvidia_1 = ""
        print("info: paralel nvidia installation is not allowed")
        doubleselection = 1
    elif toolslist[5] == 1 and gofortools == 1:
        nvidia_2 = "nvidia-glG05"
        print("info:", nvidia_2, "selected")
        doubleselection = 0
    else:
        nvidia_2 = ""

    if toolslist[6] == 1 and gofortools == 1:
        steamcontroller_1 = "steam-controller"
        print("info:", steamcontroller_1, "selected")
    else:
        steamcontroller_1 = ""

    if toolslist[7] == 1 and gofortools == 1:
        hold = "-hold"
        print("info: keep Terminalwindow open when done" )
    else:
        hold = ""

#    if toolslist[11] == 1 and gofortools == 1:
 #       hold = "-hold"
 #       print("info: keep Terminalwindow open when done" )
 #   else:
 #       hold = ""
    if doubleselection == 0:
        confirm_toolsinstall = askokcancel(title="Attention",
        message="\nThe selected tools will be installed. Please provide your root password\n    \n")
    else:
        tk.messagebox.showinfo(title="Error", message="\nParalel Nvidia installation is not allowed    \n Nvidia driver will NOT be installed")
        confirm_toolsinstall = 0
    #perform installation
    if gofortools == 1 and confirm_toolsinstall == 1:
        process = subprocess.call(['bash', 'bash/tools.sh', str(hold), str(cups_1), str(codecs_1), str(fonts_1), str(solaar_1), str(nvidia_1), str(nvidia_2), str(steamcontroller_1)], stdout=subprocess.PIPE)
    #message if terminal closes without error
        tk.messagebox.showinfo(title="Done", message="\nSeems like everything is done    \n")
        print("seems like everything is done")
    else:
    #message if terminal closes with error
        tk.messagebox.showinfo(title="Warning", message="\nInstallation aborted    \n")
        print("Info: installation cancelled")

#I cant believe this is working ...

Mainwindow()
mainwindow.mainloop()


