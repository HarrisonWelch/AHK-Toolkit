; Mac to PicPic screenshot hotkey
; Make Alt+Shift+4 hit Shift+PrtScr for PicPic "Capture Region" to start

#NoEnv
#SingleInstance force
#Persistent

winCommand(type)
{
    if (type = "C") ; Copy
        Send {CtrlDown}c{CtrlUp}
    else if (type = "P") ; Paste
        Send {CtrlDown}v{CtrlUp}
    else if (type = "R") ; Run
        Send {LWin down}r{LWin up}
    else if (type = "E") ; File Explorer
        Send {LWin down}e{LWin up}
    else if (type = "SA") ; Select All
        Send {Ctrl down}a{Ctrl up}
    return
}

!+4::
    Send {ShiftDown}{PrintScreen}{ShiftUp}
return

^!+K::
    ExitApp
return