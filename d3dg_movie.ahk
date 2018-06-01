; TESTING. NOTHING TO SEE HERE RIGHT NOW.
;
; D3DGear Configurator
; Save and load movie presets.
;
; FMMT666(ASkr)



WinMovie_FindAndActivate( )
{
    ; as it seems, it is not possible to use a variable for the search string...
    if WinExist( "D3DGear Properties" )
    {
        WinActivate
        return 1
    }
    else
        return 0
}



if !WinMovie_FindAndActivate()
{
    MsgBox ERROR: Could not find the D3DGear Properties window.
    exit -1
}


MsgBox, Select the "Record Movie" page, then click OK.




Gui, Add, Text, w300 Center, *** TESTING TESTING TESTING TESTING ***
Gui, Add, Button, , Read Configuration
Gui, Add, ListView, w300 NoSort ReadOnly gListDebug, Setting|Value
Gui, Add, Button, , QUIT
; Gui, Show,, D3DGear Configurator
Gui, Show,, Dingsbums Configurator


return


ListDebug:
    return


ButtonReadConfiguration:

    WinMovie_FindAndActivate( )
    ControlGetText, txtSavePath, Edit2, A
    ControlGetText, txtResolution, Edit4, A
    ControlGetText, txtButton14, Button14, A

    MsgBox % "Hier: " txtSavePath

    LV_Add( , "Path", txtSavePath )
    LV_Add( , "Resolution", txtResolution )
    LV_Add( , "just a button", txtButton14 )
    LV_Add( , "Plan", "Get drunk bc of AutoHotkey." )

    GuiControl, +Redraw, ListDebug
    
    LV_ModifyCol()

    return


GuiClose:
ButtonQUIT:
    ExitApp
