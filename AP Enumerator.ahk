#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force ; Only one AHK instance can be run at the same time.
if not A_IsAdmin
	Run *RunAs "%A_ScriptFullPath%"

hostname = AP_
counter = 01
user_start_counter = 01
counter_length := StrLen(user_start_counter)
counter_format = {:0%counter_length%}

Gui, Add, Button, x302 y29 w100 h40 gset_hostname, Set
Gui, Add, Button, x302 y79 w100 h40 greset_counter, Reset Counter
Gui, Add, Edit, x52 y29 w120 h40 vuser_hostname, %hostname%
Gui, Add, Edit, x182 y29 w110 h40 vuser_start_counter, %counter%
Gui, Add, Text, x52 y79 w120 h40 , Next Hostname:
Gui, Add, Text, x182 y79 w110 h40 vshow_next_hostname, %hostname%%counter%
Gui, Add, Text, x52 y9 w120 h20 , Hostname:
Gui, Add, Text, x182 y9 w110 h20 , Counter start:
Gui, Add, Text, x2 y120 w150 h20 , Strg + H: Help File
Gui, Show, w450 h135, AP Enumerator
return

GuiClose:
ExitApp

reset_counter:
counter = %user_start_counter%
GuiControl,,show_next_hostname,%hostname%%counter%
return

set_hostname:
GuiControlGet, hostname,, user_hostname
GuiControlGet, user_start_counter
counter = %user_start_counter%
counter_length := StrLen(user_start_counter)
counter_format = {:0%counter_length%}
counter := Format(counter_format, counter)
GuiControl,,show_next_hostname,%hostname%%counter%
return

^h::
MsgBox,,Help File, Strg + R: Rename AP`nPage Up: Count Hostname up by one`nPage Down: Count Hostname down by one`n`nhttps://github.com/Bofrostmann07`nRomario Muza
return

PgUp::
counter++
counter := Format(counter_format, counter)
GuiControl,,show_next_hostname,%hostname%%counter%
return

PgDn::
counter--
counter := Format(counter_format, counter)
GuiControl,,show_next_hostname,%hostname%%counter%
return

#IfWinActive, ahk_exe Ekahau Pro.exe
^r::
Send, ^a
Send {BackSpace}
Send, %hostname%%counter%
counter++
counter := Format(counter_format, counter)
GuiControl,,show_next_hostname,%hostname%%counter%
return

#IfWinActive, ahk_exe Ekahau AI Pro.exe
^r::
Send, ^a
Send {BackSpace}
Send, %hostname%%counter%
counter++
counter := Format(counter_format, counter)
GuiControl,,show_next_hostname,%hostname%%counter%
return
