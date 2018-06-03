; TESTING. NOTHING TO SEE HERE RIGHT NOW.
;
; D3DGear Configurator
; Save and load movie presets.
;
; FMMT666(ASkr)


;-------------------------------------------------------------------------------------------------
WinMovie_Find()
{
    if WinExist( "D3DGear Properties" )
        return 1
    else
        return 0
}


;-------------------------------------------------------------------------------------------------
WinMovie_FindAndActivate()
{
    if WinExist( "D3DGear Properties" )
    {
        WinActivate
        return 1
    }
    else
        return 0
}



;-------------------------------------------------------------------------------------------------
;--- main action
;-------------------------------------------------------------------------------------------------
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

    ; --- check that we are working with the right stuff here...

    if( !WinMovie_FindAndActivate() )
    {
        MsgBox Cannot find the D3DGear Properties window.
        return
    }

    ControlGetText, tmpVar, Static12, A
    if( tmpVar != "Save movie file to this folder:" )
    {
        MsgBox There should be a text field`n"Save movie file to this folder:",`nbut I can't find it...
        return
    }
    ; It is not required that the "Record Movie" tab is activated, but it's better if it is.
    ControlGet, tmpVar, Visible, , Static12, A 
    if( tmpVar = 0 )
    {
        MsgBox Please activate the "Record Movie" tab in D3DGear first.
        return 
    }


    ; --- BUTTON TESTING
    ; This is going to be a problem.
    ; As an alternative, what about the registry?
    ;   HKEY_CURRENT_USER\Software\D3DGear
    ; ControlGet, valEnable, Checked, , Button14   ; does not work
    ; ControlGet, valEnable, Enabled, , Button14   ; does work; could be a workaround
    ; ControlGet, valEnable, Hwnd, , Button14      ; does work
    ; MsgBox % "Hier:" valEnable
    ; return


    ; --- basic settings
    ControlGet, valEnabled, Enabled, , Edit2, A
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
