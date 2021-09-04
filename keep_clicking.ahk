#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
#Persistent

^!+J::
    TrayTip, AHK, Starting, 3
    Loop 1000 {
        MouseClick, Left
        Sleep, 100
    }

    TrayTip, AHK, Done, 3
^!+K::
    TrayTip, AHK, Terminating, 3
    ExitApp
return
