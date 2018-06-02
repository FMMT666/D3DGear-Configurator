; TESTING. NOTHING TO SEE HERE RIGHT NOW.
;
; D3DGear Configurator
; Save and load movie presets.
;
; FMMT666(ASkr)



;-------------------------------------------------------------------------------------------------
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


;-------------------------------------------------------------------------------------------------
if !WinMovie_FindAndActivate()
{
    MsgBox ERROR: Could not find the D3DGear Properties window.
    exit -1
}


;-------------------------------------------------------------------------------------------------
;--- main action
;-------------------------------------------------------------------------------------------------
MsgBox, Select the "Record Movie" page, then click OK.
Gui, Add, Text, w300 Center, *** TESTING TESTING TESTING TESTING ***
Gui, Add, Button, , Read Configuration
Gui, Add, ListView, w300 h300 NoSort ReadOnly gListDebug, Setting|Value
Gui, Add, Button, , QUIT
Gui, Show,, D3DGear Configurator

return



;-------------------------------------------------------------------------------------------------
ListDebug:
    return


;-------------------------------------------------------------------------------------------------
ButtonReadConfiguration:
    WinMovie_FindAndActivate( )
    ControlGetText, txtSavePath, Edit2, A
    ControlGetText, txtCaptureMode, ComboBox12, A
    ControlGetText, txtHotkey, Edit3, A
    ControlGetText, txtResolution, Edit4, A
    ControlGetText, txtFrameRate, Edit5, A
    ControlGetText, txtFormat, ComboBox1, A
    ControlGetText, txtThreads, ComboBox7, A
    ControlGetText, txtCodec, ComboBox2, A
    ControlGetText, txtQuality, ComboBox8, A

    LV_Add( , "Path", txtSavePath )
    LV_Add( , "Capture Mode", txtCaptureMode )
    LV_Add( , "Hotkey", txtHotkey )
    LV_Add( , "Resolution", txtResolution )
    LV_Add( , "Frame Rate", txtFrameRate )
    LV_Add( , "Format", txtFormat )
    LV_Add( , "Threads", txtThreads )
    LV_Add( , "Video Codec", txtCodec )
    LV_Add( , "Quality", txtQuality )

    GuiControl, +Redraw, ListDebug
    LV_ModifyCol()

    return


;-------------------------------------------------------------------------------------------------
GuiClose:
ButtonQUIT:
    ExitApp
