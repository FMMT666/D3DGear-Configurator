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
Gui, Add, Text, w800 Center, *** TESTING TESTING TESTING TESTING ***
Gui, Add, Button, , Read Configuration
Gui, Add, ListView, w800 h400 NoSort ReadOnly gListDebug, Setting|Value|Registry Name|Registry Value
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

    ; TODO:
    ; Find a way to activate the "Record Movie" Tab

    ; ControlClick, SysListView321, A                      ; does not work
    ; ControlClick, x20 y50, "D3DGear Properties",,,, NA   ; does not work
    ; ControlGet, count, List, count, SysListView321, A    ; does not work
    ; ControlSend, SysListView321, {Enter}, A              ; does not work
    

    ; TODO:
    ; This does not work if D3DGear was just started and nothing had been clicked.
    ; Apparently, all the fields in all other tabs than "General" aren't available yet...
    ControlGetText, tmpVar, Static12, A
    if( tmpVar != "Save movie file to this folder:" )
    {
        MsgBox There should be a text field`n"Save movie file to this folder:",`nbut I can't find it...
        return
    }

    ; It is not required that the "Record Movie" tab is activated, but it's better if it is.
    ControlGet, tmpVar, Visible, , Static12,
    if( tmpVar = 0 )
    {
        MsgBox Please activate the "Record Movie" tab in D3DGear first.
        return 
    }


    ; --- BUTTON TESTING
    ; This is going to be a problem as there's no possibility to read them with AHK.
    ; As an alternative, we're reading the registry and using a combimed save/load/update-gui strategy...
    ;
    ; ControlGet, valEnable, Checked, , Button14   ; does not work
    ; ControlGet, valEnable, Enabled, , Button14   ; does work; could be a workaround
    ; ControlGet, valEnable, Hwnd, , Button14      ; does work


    ; What a mess...

    ; TODO:
    ;  - some registry keys are only created after  are existing

    ; --- basic settings
    ControlGet, valEnabled, Enabled, , Edit2, A    ; testing for "enabled" by evaluating state of save folder edit field
    RegRead, regEnableMovie, HKEY_CURRENT_USER\Software\D3DGear\Movie, EnableMovie

    ControlGetText, txtSavePath, Edit2, A
    RegRead, regSaveFolder2, HKEY_CURRENT_USER\Software\D3DGear\Movie, SaveFolder2

    ControlGetText, txtCaptureMode, ComboBox12, A
    RegRead, regHotKeyMode, HKEY_CURRENT_USER\Software\D3DGear\General, HotKeyMode

    ControlGetText, txtHotkey, Edit3, A
    RegRead, regHotkey2, HKEY_CURRENT_USER\Software\D3DGear\Movie, Hotkey2


    ; --- video settings
    ControlGetText, txtResolution, Edit4, A
    RegRead, regResolution2, HKEY_CURRENT_USER\Software\D3DGear\Movie, Resolution2

    ControlGetText, txtFrameRate, Edit5, A
    ; RegRead, reg???, HKEY_CURRENT_USER\Software\D3DGear\Movie, ???

    ControlGetText, txtFormat, ComboBox1, A
    RegRead, regMovieFormat2, HKEY_CURRENT_USER\Software\D3DGear\Movie, MovieFormat2

    ControlGetText, txtThreads, ComboBox7, A
    ; RegRead, reg???, HKEY_CURRENT_USER\Software\D3DGear\Movie, ???

    ControlGetText, txtVideoCodec, ComboBox2, A
    RegRead, regVideoCodec3, HKEY_CURRENT_USER\Software\D3DGear\Movie, VideoCodec3

    ControlGetText, txtQuality, ComboBox8, A
    RegRead, regMovieQuality, HKEY_CURRENT_USER\Software\D3DGear\Movie, MovieQuality


    ; --- audio settings
    ControlGetText, txtAudioCodec, ComboBox11, A
    ; RegRead, reg???, HKEY_CURRENT_USER\Software\D3DGear\Movie, ???

    ControlGetText, txtMainSound, ComboBox6, A
    RegRead, regDeviceName2, HKEY_CURRENT_USER\Software\D3DGear\Movie, DeviceName2

    ControlGetText, txtMainVolume, Edit6, A
    RegRead, regDeviceVolume, HKEY_CURRENT_USER\Software\D3DGear\Movie, DeviceVolume

    ControlGetText, txtMicro, ComboBox5, A
    ; RegRead, reg???, HKEY_CURRENT_USER\Software\D3DGear\Movie, ???

    ControlGetText, txtMicroVolume, Edit7, A
    RegRead, regMicDeviceVolume, HKEY_CURRENT_USER\Software\D3DGear\Movie, MicDeviceVolume

    ControlGetText, txtAudioStreams, ComboBox13, A
    ; RegRead, reg???, HKEY_CURRENT_USER\Software\D3DGear\Movie, ???


    ; --- display all that stuff
    LV_Delete()

    LV_Add( , "Enabled",           ""              , "EnableMovie"        , regEnableMovie              )
    LV_Add( , "Path",              txtSavePath     , "SaveFolder2"        , regSaveFolder2              )
    LV_Add( , "Capture Mode",      txtCaptureMode  , "HotkeyMode"         , regHotKeyMode               )
    LV_Add( , "Hotkey",            txtHotkey       , "Hotkey2"            , regHotkey2                  )
                             
    LV_Add( , "Resolution",        txtResolution   , "Resolution2"        , regResolution2              )
    LV_Add( , "Frame Rate",        txtFrameRate    , ""                   , ""                          )
    LV_Add( , "Format",            txtFormat       , "MovieFormat2"       , regMovieFormat2             ) 
    LV_Add( , "Threads",           txtThreads      , ""                   , ""                          )
    LV_Add( , "Video Codec",       txtVideoCodec   , "VideoCodec3"        , regVideoCodec3              )
    LV_Add( , "Quality",           txtQuality      , "MovieQuality"       , regMovieQuality             ) 
                             
    LV_Add( , "Audio Codec",       txtAudioCodec   , ""                   , ""                          )
    LV_Add( , "Main Sound",        txtMainSound    , "DeviceName2"        , regDeviceName2              )
    LV_Add( , "Main Volume",       txtMainVolume   , "DeviceVolume"       , regDeviceVolume             )
    LV_Add( , "Microphone",        txtMicro        , ""                   , ""                          )
    LV_Add( , "Microphone Volume", txtMicroVolume  , "MicDeviceVolume"    , regMicDeviceVolume          )
    LV_Add( , "Audio Streams",     txtAudioStreams , ""                   , ""                          )

    GuiControl, +Redraw, ListDebug
    LV_ModifyCol()

    return


;-------------------------------------------------------------------------------------------------
GuiClose:
ButtonQUIT:
    ExitApp
