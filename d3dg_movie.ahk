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
Gui, Add, ListView, w800 h500 NoSort ReadOnly gListDebug, Setting|Value|Registry Name|Registry Value
Gui, Add, Button, , QUIT
Gui, Show,, D3DGear Configurator

return



;-------------------------------------------------------------------------------------------------
ListDebug:
    return


;-------------------------------------------------------------------------------------------------
ButtonAddRegistryDefaults:
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

    ; also done below, but let's just use this to check whether D3DGear is in the registry at all...
    RegRead, regSaveFolder2, HKEY_CURRENT_USER\Software\D3DGear\Movie, SaveFolder2
    if( ErrorLevel )
    {
        MsgBox No "SaveFolder2" key/value pair in`nHKEY_CURRENT_USER\Software\D3DGear\Movie\SaveFolder2`nSuspicious. Stopping here...
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
    if( ErrorLevel )
        regEnableMovie := "*** MISSING ***"

    ControlGetText, txtSavePath, Edit2, A
    RegRead, regSaveFolder2, HKEY_CURRENT_USER\Software\D3DGear\Movie, SaveFolder2
    if( ErrorLevel )
        regSaveFolder2 := "*** MISSING ***"

    ControlGetText, txtCaptureMode, ComboBox12, A
    RegRead, regHotKeyMode, HKEY_CURRENT_USER\Software\D3DGear\General, HotKeyMode
    if( ErrorLevel )
        regHotKeyMode := "*** MISSING ***"

    ControlGetText, txtHotkey, Edit3, A
    RegRead, regHotkey2, HKEY_CURRENT_USER\Software\D3DGear\Movie, Hotkey2
    if( ErrorLevel )
        regHotkey2 := "*** MISSING ***"


    ; --- video settings
    ControlGetText, txtResolution, Edit4, A
    RegRead, regResolution2, HKEY_CURRENT_USER\Software\D3DGear\Movie, Resolution2
    if( ErrorLevel )
        regResolution2 := "*** MISSING ***"

    ControlGetText, txtFrameRate, Edit5, A
    RegRead, regMovieFrameRate2, HKEY_CURRENT_USER\Software\D3DGear\Movie, MovieFrameRate2
    if( ErrorLevel )
        regMovieFrameRate2 := "*** MISSING ***"

    ControlGetText, txtFormat, ComboBox1, A
    RegRead, regMovieFormat2, HKEY_CURRENT_USER\Software\D3DGear\Movie, MovieFormat2
    if( ErrorLevel )
        regMovieFormat2 := "*** MISSING ***"

    ControlGetText, txtThreads, ComboBox7, A
    RegRead, regMovieEncodingThread, HKEY_CURRENT_USER\Software\D3DGear\Movie, MovieEncodingThread
    if( ErrorLevel )
        regMovieEncodingThread := "*** MISSING ***"

    ControlGetText, txtVideoCodec, ComboBox2, A
    RegRead, regVideoCodec3, HKEY_CURRENT_USER\Software\D3DGear\Movie, VideoCodec3
    if( ErrorLevel )
        regVideoCodec3 := "*** MISSING ***"

    ControlGetText, txtQuality, ComboBox8, A
    RegRead, regMovieQuality, HKEY_CURRENT_USER\Software\D3DGear\Movie, MovieQuality
    if( ErrorLevel )
        regMovieQuality := "*** MISSING ***"


    ; --- audio settings
    ControlGetText, txtAudioCodec, ComboBox11, A
    RegRead, regAudioCodec3, HKEY_CURRENT_USER\Software\D3DGear\Movie, AudioCodec3
    if( ErrorLevel )
        regAudioCodec3 := "*** MISSING ***"

    RegRead, regEnableAudioRecording, HKEY_CURRENT_USER\Software\D3DGear\Movie, EnableAudioRecording
    if( ErrorLevel )
        regEnableAudioRecording := "*** MISSING ***"

    ControlGetText, txtMainSound, ComboBox6, A
    RegRead, regDeviceName2, HKEY_CURRENT_USER\Software\D3DGear\Movie, RecDeviceName2
    if( ErrorLevel )
        regDeviceName2 := "*** MISSING ***"

    ControlGetText, txtMainVolume, Edit6, A
    RegRead, regRecDeviceVolume, HKEY_CURRENT_USER\Software\D3DGear\Movie, RecDeviceVolume
    if( ErrorLevel )
        regRecDeviceVolume := "*** MISSING ***"

    RegRead, regEnableMicRecording, HKEY_CURRENT_USER\Software\D3DGear\Movie, EnableMicRecording
    if( ErrorLevel )
        regEnableMicRecording := "*** MISSING ***"

    ControlGetText, txtMicro, ComboBox5, A
    RegRead, regMicDeviceName2, HKEY_CURRENT_USER\Software\D3DGear\Movie, MicDeviceName2
    if( ErrorLevel )
        regMicDeviceName2 := "*** MISSING ***"

    ControlGetText, txtMicroVolume, Edit7, A
    RegRead, regMicDeviceVolume, HKEY_CURRENT_USER\Software\D3DGear\Movie, MicDeviceVolume
    if( ErrorLevel )
        regMicDeviceVolume := "*** MISSING ***"

    RegRead, regIgnoreSurroundChannel, HKEY_CURRENT_USER\Software\D3DGear\Movie, IgnoreSurroundChannel
    if( ErrorLevel )
        regIgnoreSurroundChannel := "*** MISSING ***"

    ControlGetText, txtAudioStreams, ComboBox13, A
    RegRead, regAudioStreamSave, HKEY_CURRENT_USER\Software\D3DGear\Movie, AudioStreamSave
    if( ErrorLevel )
        regAudioStreamSave := "*** MISSING ***"

    RegRead, regIncludeMouseCursor, HKEY_CURRENT_USER\Software\D3DGear\Movie, IncludeMouseCursor
    if( ErrorLevel )
        regIncludeMouseCursor := "*** MISSING ***"

    RegRead, regIncludeFramerate1, HKEY_CURRENT_USER\Software\D3DGear\Movie, IncludeFramerate1
    if( ErrorLevel )
        regIncludeFramerate1 := "*** MISSING ***"


    ; --- display all that stuff
    LV_Delete()

    LV_Add( , "Enabled",           valEnabled            , "EnableMovie"           , regEnableMovie              )
    LV_Add( , "Path",              txtSavePath           , "SaveFolder2"           , regSaveFolder2              )
    LV_Add( , "Capture Mode",      txtCaptureMode        , "HotkeyMode"            , regHotKeyMode               )
    LV_Add( , "Hotkey",            txtHotkey             , "Hotkey2"               , regHotkey2                  )
                                      
    LV_Add( , "Resolution",        txtResolution         , "Resolution2"           , regResolution2              )
    LV_Add( , "Frame Rate",        txtFrameRate          , "MovieFrameRate2"       , regMovieFrameRate2          )
    LV_Add( , "Format",            txtFormat             , "MovieFormat2"          , regMovieFormat2             ) 
    LV_Add( , "Threads",           txtThreads            , "MovieEncodingThread"   , regMovieEncodingThread      )
    LV_Add( , "Video Codec",       txtVideoCodec         , "VideoCodec3"           , regVideoCodec3              )
    LV_Add( , "Quality",           txtQuality            , "MovieQuality"          , regMovieQuality             ) 
                                      
    LV_Add( , "Audio Codec",       txtAudioCodec         , "AudioCodec3"           , regAudioCodec3              )
    LV_Add( , "Main Sound Enable", "---"                 , "EnableAudioRecording"  , regEnableAudioRecording     )
    LV_Add( , "Main Sound",        txtMainSound          , "DeviceName2"           , regDeviceName2              )
    LV_Add( , "Main Volume",       txtMainVolume         , "RecDeviceVolume"       , regRecDeviceVolume          )
    LV_Add( , "Microphone Enable", "---"                 , "EnableMicRecording"    , regEnableMicRecording       )
    LV_Add( , "Microphone",        txtMicro              , "MicDeviceName2"        , regMicDeviceName2           )
    LV_Add( , "Microphone Volume", txtMicroVolume        , "MicDeviceVolume"       , regMicDeviceVolume          )
    LV_Add( , "Convert Surround",  "---"                 , "IgnoreSurroundChannel" , regIgnoreSurroundChannel    )
    LV_Add( , "Audio Streams",     txtAudioStreams       , "AudioStreamSave"       , regAudioStreamSave          )
    LV_Add( , "Game Audio Only",   "---"                 , "---"                   , "---"                       )

    LV_Add( , "Capture Mouse",     "---"                 , "IncludeMouseCursor"    , regIncludeMouseCursor       )
    LV_Add( , "Include Framerate", "---"                 , "IncludeFramerate1"     , regIncludeFramerate1        )


    GuiControl, +Redraw, ListDebug
    LV_ModifyCol()

    return


;-------------------------------------------------------------------------------------------------
GuiClose:
ButtonQUIT:
    ExitApp
