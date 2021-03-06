
D3DGear Configurator
====================

A simple [AutoHotkey][2] script to save and load [D3DGear][1] configurations.  
NOT COMPLETELY FUNCTIONAL RIGHT NOW.


---

## News

  t.b.w...


---

## TODO

  - Some of the registry key/value pairs are not created before the related function is clicked in the GUI.  
    That could be a problem. What's not there can not (reliably) stored back, even if we include the user's  
    missing key/value pairs...
  - found some bugs in D3DGear; should I fix those? \\(°_° )
  - add some "save as preset" buttons or other selection
  - implement writing to the GUI and registry
  - find a way to navigate through the tabs
  - ...

---

## NOTES

### Registry

#### Record Movie Tab

  The "checkboxes" (which are actually buttons) cannot be read by AutoHotkey.  
  Same for the menu on the left. "SysListView321" can neither be read nor operated (Windoze 10).

  Almost all features are in [HKEY_CURRENT_USER\Software\D3DGear\Movie]:

    "VideoCodec3"=dword:00000006
    "SaveFolder2"="D:\\GamesRecording"
    "Hotkey2"=dword:010000b5
    "Resolution2"=dword:07800168
    "MovieQuality"=dword:00000001
    "RecDeviceName2"="Default playback device"
    "MovieFormat2"=dword:00000001
    "EnableMovie"=dword:00000001
    "MicDeviceVolume"=dword:00000064
    "RecDeviceVolume"=dword:00000064
    "MovieFramerate2"=dword:0000001e
    "MovieEncodingThread"=dword:00000000
    "EnableMicRecording"=dword:00000000
    "IgnoreSurroundChannel"=dword:00000000
    "IncludeMouseCursor"=dword:00000000
    "NotifyMe"=dword:00000000
    "IncludeFramerate1"=dword:00000000
    "AudioCodec3"=dword:00000001
    "EnableAudioRecording"=dword:00000001
    "AudioStreamSave"=dword:00000000
    "MicDeviceName2"=""

  but also one in [HKEY_CURRENT_USER\Software\D3DGear\General]:

    "HotkeyMode"=dword:00000000

  Unfortunately, most of them only appear after the user actively clicked the corresponding fields in the GUI.
  Although they're (hopefully) all included here, storing them back (writing to D3DGear) could be problematic,
  as it's not clear _what_ shall be written. The first entry of a combo box? A zero for an "Enabled" function?
  Or a one?

  E.g., the "Audio Codec" combo box has three items (on my system):

    Raw PCM
    MP3
    AAC

  Without any entry in the registry, my system's default is "MP3" (REG_DWORD 0x1), the 2nd entry...  
  Maybe there's a dirty workaround, somewhere out there :-)

  A fresh installation of D3DGear only creates the (movie) key/value pair

  Almost all features are in [HKEY_CURRENT_USER\Software\D3DGear\Movie]:

    "VideoCodec3"=dword:00000006
    "SaveFolder2"="C:\\Users\user\Videos"

  The rest of the GUI is set to:

  - Game Mode
  - Hotkey F8
  - 1280x720
  - 30 fps
  - Format AVI2 (OpenDML), 2nd combo box item
  - Threads "Auto", 1st combo box item
  - Fast MPEG-4 Version 2 Codec, 1st combo box item
  - Best Quality, 3rd combo box item
  - Audio MP3, 2nd combo box item
  - [X] Main sound, enabled
  - Default playback device, 1st combo boy item
  - Main Volume 100
  - [ ] Microphone, nothing (don't have one attached)
  - Mic Volume 100
  - [ ] Convert surround channel to stereo channel, disabled
  - Merge and save audio..., 1st combo box item
  - [ ] Capture game audio only, disabled
  - [X] Capture mouse cursor movement, enabled
  - [ ] Add framerate number, disabled

#### Regedit Parameter Trick

  The Windoze registry editor does not allow command line parameters, e.g. a path that should be opened, but
  there's a nice workaround, to directly open the D3DGear (or other) settings.  

  Just store the path that shoukd be opened in the key.

    HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit\Lastkey

  as a "REG_SZ" value, e.g.

    HKCU\Software\D3DGear


---

## CHANGES

### 2018/06/XX:
    - just learned how to AutoHotkey w/o jumping off the roof
    - shaking fists at AutoHotkey
    - reading of all combo and edit fields of the "Record Movie" tab
    - started reading the registry too
    - 80% of the "Record Movie" tab can now successfully be read
    - so much for a "hey, that'll only take 2..3 hours"
    - experimenting with adding the missing default values
    - default, missing movie settings now complete
          


Have fun  
FMMT666(ASkr)  


[1]: http://www.d3dgear.com
[2]: https://autohotkey.com
