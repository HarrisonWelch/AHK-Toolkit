import os

def writeln(fl, str):
    fl.write(str + "\n")

if __name__ == "__main__":
    f = open("key_set.ahk", 'w')

    writeln(f, "#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.")
    writeln(f, "#SingleInstance force")
    writeln(f, "#Persistent")

    writeln(f, "")

    for i in range(1, 200+1):
    # for i in range(120, 159+1):
        writeln(f, "SC" + str(i) + ":: ; key value for " + str(i))
        writeln(f, "MsgBox, %A_ThisHotkey% was pressed.")
        writeln(f, "return")
        writeln(f, "")

    writeln(f, "^!+K::")
    writeln(f, "   ExitApp")
    writeln(f, "return")
