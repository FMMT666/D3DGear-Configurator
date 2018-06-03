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
Gui, Add, Text, w500 Center, *** TESTING TESTING TESTING TESTING ***
Gui, Add, Button, , Read Configuration
Gui, Add, ListView, w500 h400 NoSort ReadOnly gListDebug, Setting|Value
Gui, Add, Button, , QUIT
Gui, Show,, D3DGear Configurator

return



;-------------------------------------------------------------------------------------------------
ListDebug:
    return


;-------------------------------------------------------------------------------------------------
ButtonReadConfiguration:
    WinMovie_FindAndActivate( )

    ; --- basic settings
    ControlGetText, txtSavePath, Edit2, A
    ControlGetText, txtCaptureMode, ComboBox12, A
    ControlGetText, txtHotkey, Edit3, A

    ; --- video settings
    ControlGetText, txtResolution, Edit4, A
    ControlGetText, txtFrameRate, Edit5, A
    ControlGetText, txtFormat, ComboBox1, A
    ControlGetText, txtThreads, ComboBox7, A
    ControlGetText, txtVideoCodec, ComboBox2, A
    ControlGetText, txtQuality, ComboBox8, A

    ; --- audio settings
    ControlGetText, txtAudioCodec, ComboBox11, A
    ControlGetText, txtMainSound, ComboBox6, A
    ControlGetText, txtMainVolume, Edit6, A
    ControlGetText, txtMicro, ComboBox5, A
    ControlGetText, txtMicroVolume, Edit7, A
    ControlGetText, txtAudioStreams, ComboBox13, A

    ; --- display all that stuff
    LV_Delete()

    LV_Add( , "Path", txtSavePath )
    LV_Add( , "Capture Mode", txtCaptureMode )
    LV_Add( , "Hotkey", txtHotkey )

    LV_Add( , "Resolution", txtResolution )
    LV_Add( , "Frame Rate", txtFrameRate )
    LV_Add( , "Format", txtFormat )
    LV_Add( , "Threads", txtThreads )
    LV_Add( , "Video Codec", txtVideoCodec )
    LV_Add( , "Quality", txtQuality )

    LV_Add( , "Audio Codec", txtAudioCodec )
    LV_Add( , "Main Sound", txtMainSound )
    LV_Add( , "Main Volume", txtMainVolume )
    LV_Add( , "Microphone", txtMicro )
    LV_Add( , "Microphone Volume", txtMicroVolume )
    LV_Add( , "Audio Streams", txtAudioStreams )

    GuiControl, +Redraw, ListDebug
    LV_ModifyCol()

    return


;-------------------------------------------------------------------------------------------------
GuiClose:
ButtonQUIT:
    ExitApp
