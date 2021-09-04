#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
#Persistent

global gVPNPassword := "<YOUR-PASSWORD>"

SC122:: ; Media Play/Pause - Connects to VPN
    VPN()
return

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
}

VPN()
{
    TrayTip, AHK, Connecting to VPN
    Run "C:\Program Files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client\vpnui.exe"
    WinWaitActive, Cisco AnyConnect Secure Mobility Client, , 30 ; Wait unit a window becomes active
    WinActivate, Cisco AnyConnect Secure Mobility Client ; Activates the specified window
    ControlClick Edit1, Cisco AnyConnect Secure Mobility Client ; Get into address box
    winCommand("SA") ; Select All
    SendInput {BackSpace} ; Delete whatever may be in the box
    Send vpn.ssina.biz ; Send this address
    ControlClick, Button1, Cisco AnyConnect Secure Mobility Client ; Enter

    if WinActive("Cisco AnyConnect")
        WinActivate, Cisco AnyConnect
    else
        WinWaitActive, Cisco AnyConnect, , 30

    If WinActive(Cisco AnyConnect)
    {
        ControlClick, Edit2, Cisco AnyConnect
        Send, {raw}%gVPNPassword% ; Type password
        Send, {Enter} ; Confirm
    }
}

^!+K::
    ExitApp
return
