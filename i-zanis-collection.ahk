#NoEnv                      ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance FORCE       ; Skip invocation dialog box and silently replace previously executing instance of this script.
SendMode Input              ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
; #Warn                     ; Enable warnings to assist with detecting common errors.


;----------------------------------------------------------------------------
  ;Always on top

  ;#Space::WinSet, AlwaysOnTop, Toggle, A
  ;return



;----------------------------------------------------------------------------
  ;AutoCorrect

  ;::}ahk::autohotkey



  ;----------------------------------------------------------------------------
  ;Transparency toggle, Scroll Lock
  sc046::
  toggle:=!toggle
  if toggle=1
  {
    WinSet, Transparent, 150, A
  }else  {
    WinSet, Transparent, OFF, A
  }
return



;----------------------------------------------------------------------------
;NumPad Shortcuts, Ctrl+NumPad

#NumPad1::
  Run,https://www.youtube.com
return

#NumPad2::
  Run,https://www.netflix.com/browse
return

#NumPad3::
  Run,https://www.netflix.com/browse
return

#NumPad4::
  Run,https://www.netflix.com/browse
return

#NumPad5::
  Run,https://www.netflix.com/browse
return

#NumPad6::
  Run,https://www.netflix.com/browse
return

#NumPad7::
  run, "cmd.exe"
return

#NumPad8::
  run, "Notepad.exe"
return

#NumPad9::
  run, "Notepad.exe"
return

;I have other ones, but you get the idea, just simply running apps or websites



;----------------------------------------------------------------------------
;Chrome Incognito, Pause/Break

;Pause::
  ;run, "chrome.exe" -incognito
  ;return

  ;Pause/Break key to close the active window
  ;Pause::WinClose, A
  ;
  ;YouTube Incognito
  ;Pause & Home::
  ;Run "chrome.exe" -incognito "https://www.youtube.com"
  ;return



  ;----------------------------------------------------------------------------
  ;Volume control, Alt+Scroll wheel (and Mbutton)

  ;Alt & WheelUp::Volume_Up
  ;Alt & WheelDown::Volume_Down
  ;Alt & MButton::Volume_Mute


  ;
  ;----------------------------------------------------------------------------
  ;Suspend hotkeys
  ;!s::
  ;suspend, toggle
  ;return



  ;----------------------------------------------------------------------------
  ;Fixing/repurposing Fn+function keys

  ;My keyboard is the Red Dragon Mitra K551

  ;Fn+F1 sends you to Spotify instead of windows media player
  ;Launch_Media::
  ;Run,Spotify.exe
  ;return

  ;Fn+F9 sends you to Gmail instead of Outlook
  ;Launch_Mail::
  ;Run, "https://mail.google.com"
  ;return

  ;Fn+F10 basically does the same thing it did before, mine stopped working, I think
  ;something to do with the accounts
  ;Browser_Home::
  ;Run, "chrome.exe"
  ;return

  ;Fn+F12 sends you to google drive instead of searching (Ctrl+f or even F3 are more
  ;reliable for searching, at leat on chrome)
  ;Browser_Search::
  ;run, https://drive.google.com/drive
  ;return



  ;----------------------------------------------------------------------------
  ;Other random ideas not on my main script
  ;----------------------------------------------------------------------------

  ;Emptying recycle bin with a shortcut

  ;^f1::FileRecycleEmpty
  ;return



  ;----------------------------------------------------------------------------
  ;Quicker Alt tab, Caps Lock (I mainly used it for quickly switching between half
  ;life and a half life guide)

  ;CapsLock::
  ;send {Alt Down}
  ;sleep 0030
  ;send {Tab}
  ;sleep 0010
  ;Send {Alt Up}
  ;return



  ;----------------------------------------------------------------------------
  ;Function keys to maximize and minimize the active window

  ;f7::WinMinimize, A
  ;return

  ;f8::WinMaximize, A
  ;return



  ;----------------------------------------------------------------------------
  ;Auto greater and lesser than for html, and since this one sends both, you
  ;could make a script that instead of sending greater than, shift+< would send ,
  ;as a closing tag

  ;$<::
  ;send, <
  ;sleep 0010
  ;send, >
  ;sleep 0010
  ;send, {Left}
  ;return



  ;----------------------------------------------------------------------------
  ;Volume mixer, f7 opens it, if it's not active it recalls it, if its active,
  ;it closes it

  ;#MaxThreadsPerHotkey 2
  ;SetTitleMatchMode, 2

  ;F7::
  ;Run, "SndVol.exe"
  ;return
  ;
  ;#IfWinActive Mezclador
  ;    F7::WinClose, A

  launchOrSwitchGimp()
  {
    IfWinExist ahk_class ahk_class gdkWindowToplevel
    {
      WinActivateBottom, ahk_class gdkWindowToplevel
    }else  {
      Run "C:\Program Files\GIMP 2\bin\gimp-2.10.exe"
    }
    Return
  }

  #z::launchOrSwitchGimp()
  ;    return

  launchOrSwitchFigma()
  {
    IfWinExist ahk_exe Figma.exe
    {
      WinActivateBottom, ahk_exe Figma.exe
    }else  {
      Run "C:\Users\JEITI\AppData\Local\Figma\figma.exe"
    }
    Return
  }

  #x::launchOrSwitchFigma()
  ;    return

  launchOrSwitchPostman()
  {
    IfWinExist ahk_exe Postman.exe
    {
      WinActivateBottom, ahk_exe Postman.exe
    }else  {
      Run "C:\Users\JEITI\AppData\Local\Postman\Postman.exe"
    }
    Return
  }
  #c::launchOrSwitchPostman()
  ;    return

  ;-------------------------------------------------------------------------------
  launchOrSwitchNeovim()
  {
    IfWinExist ahk_exe nvim.exe
    {
      WinActivateBottom, ahk_exe nvim.exe
    }else  {
      Run "C:\tools\neovim\Neovim\bin\nvim.exe"
    }
    Return
  }

  #q::launchOrSwitchNeovim()
  ;    return
  ;-------------------------------------------------------------------------------

  ;-------------------------------------------------------------------------------
  launchOrSwitchWT()
  {
    IfWinExist ahk_exe windowsterminal.exe
    {
      WinActivateBottom, ahk_exe windowsterminal.exe
    }else  {
      Run wt
    }
    Return
  }

  #t::launchOrSwitchWT()
  ;    return
  ;-------------------------------------------------------------------------------

  ;-------------------------------------------------------------------------------
  launchOrSwitchVivaldi()
  {
    IfWinExist ahk_exe vivaldi.exe
    {
      WinActivateBottom, ahk_exe vivaldi.exe
    }else  {
      Run C:\Users\JEITI\AppData\Local\Vivaldi\Application\vivaldi.exe
    }
    Return
  }

  ^#2::launchOrSwitchVivaldi()
  ;    return
  ;-------------------------------------------------------------------------------







;================================================================================================
;  CapsLock processing.  Must double tap CapsLock to toggle CapsLock mode on or off.
;================================================================================================
; Must double tap CapsLock to toggle CapsLock mode on or off.

;CapsLock::
;    KeyWait, CapsLock                                                   ; Wait forever until Capslock is released.
;    KeyWait, CapsLock, D T0.2                                           ; ErrorLevel = 1 if CapsLock not down within 0.2 seconds.
;    if ((ErrorLevel = 0) && (A_PriorKey = "CapsLock") )                 ; Is a double tap on CapsLock?
;        {
;        SetCapsLockState, % GetKeyState("CapsLock","T") ? "Off" : "On"  ; Toggle the state of CapsLock LED
;        }
;return



;================================================================================================
; Hot keys with CapsLock modifier.  See https://autohotkey.com/docs/Hotkeys.htm#combo
;================================================================================================
; GOOGLE the selected/highlighted text text.

; This prevents capslock turning on on successful attempts
~Capslock::
    SetCapsLockState, on
    KeyWait, Capslock
    SetCapsLockState, off
return
CapsLock & g::
  OldClipboard:=ClipboardAll  ;Save existing clipboard.
  Clipboard:=""
  Send ^c                     ;Copy selected test to clipboard
  ClipWait 0
    Run % "http://www.google.com/search?q=" Clipboard
  Clipboard:=OldClipboard
Return

~CapsLock up::SetCapsLockState,Off
#f::return
#s::return
#If GetKeyState("Capslock","P") ;hotkeys below this are only active when the Capslock key is Physically held down
;------------------------------------------------------------------------------
; with Windows key
;------------------------------------------------------------------------------
!s::Send,#{Left}
!e::Send,#{Up}
!f::Send,#{Right}
!d::Send,#{Down}

;------------------------------------------------------------------------------
; just Capslock
;------------------------------------------------------------------------------
s::Send,{Left}
e::Send,{Up}
f::Send,{Right}
d::Send,{Down}
#If ;this turns off the #If context above




;===============================================================================
; Capslock + r = right arrow
; if left win is down = win + right arrow (move window)
;===============================================================================
;CapsLock & r::
;	SendPlay, {Right}
;	if getkeystate("LWin") = 1
;		Send,#{Right}
;	else
;		Send,{Right}
;return



;CapsLock & #j::
;Send, {Down}
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++

;================================================================================================
; Clipboard helper functions.
;================================================================================================



