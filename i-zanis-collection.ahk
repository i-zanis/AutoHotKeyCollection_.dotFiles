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
  ^sc046::
  toggle:=!toggle
  if toggle=1
  {
    WinSet, Transparent, 150, A
  }else  {
    WinSet, Transparent, OFF, A
  }
return

//TODO Turn these into functions
; Get Gimp
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

; Get Figma
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

; Get Postman
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

; Get NeoVim
  launchOrSwitchNeovim()
  {
    IfWinExist ahk_exe nvim.exe
    {
      WinActivateBottom, ahk_exe nvim.exe
    }else  {
      Run "C:\tools\8neovim\Neovim\bin\nvim.exe"
    }
    Return
  }
  #q::launchOrSwitchNeovim()
  ;    return

; Get Windows Terminal
; Use this, don't rely on buggy PowerToys or default that opens 1+ instances
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
; Get Vivaldi
; Use as a second browser window to avoid pressing the default Win + Number
; (on taskbar) multiple times to access 2-3 individual windows spread on a
; widescreen.
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
; Get MailSpring
; Use email manager to avoid loading times on Gmail with multiple
; extensions on Chrome
;-------------------------------------------------------------------------------
  launchOrSwitchMailSpring()
  {
    IfWinExist ahk_exe mailspring.exe
    {
      WinActivateBottom, ahk_exe mailspring.exe
    }else  {
      Run C:\Users\JEITI\AppData\Local\Mailspring\mailspring.exe
    }
    Return
  }
  #m::launchOrSwitchMailSpring()
  ;    return
  ;-------------------------------------------------------------------------------



; This prevents capslock turning on successful attempts
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
#If GetKeyState("Capslock","P")

;hotkeys below this are only active when the Capslock key is Physically held down
;------------------------------------------------------------------------------
; with Windows key
;------------------------------------------------------------------------------
; These move the windows
!s::Send,#{Left}     ;win + arrow left
!e::Send,#{Up}       ;win + arrow up
!f::Send,#{Right}    ;win + arrow right
!d::Send,#{Down}     ;win + arrow down
return

;-------------------------------------------------------------------------------
; with Shift key
;-------------------------------------------------------------------------------
+1:: Run, https://online.uwl.ac.uk/ultra/courses/_174092_1/cl/outline
+2:: Run,https://online.uwl.ac.uk/ultra/courses/_174555_1/cl/outline
+3:: Run,https://online.uwl.ac.uk/ultra/courses/_174555_1/cl/outline

;------------------------------------------------------------------------------
; just Capslock
;------------------------------------------------------------------------------
s::Send,{Left}              ;arrow left
e::Send,{Up}                ;arrow up
f::Send,{Right}             ;arrow right
d::Send,{Down}              ;arrow down
; Play/Pause videos e.g. Youtube/VLC on a separate inactive window
; See other script for Youtube, requires media chrome://flags enabled
k:: Send,{Media_Play_Pause}
1:: Run, https://online.uwl.ac.uk/ultra/courses/_174092_1/cl/outline
2:: Run,https://online.uwl.ac.uk/ultra/courses/_174555_1/cl/outline
3:: Run,https://online.uwl.ac.uk/ultra/courses/_174555_1/cl/outline
4::
5:: Run,https://github.com/orgs/Orange-Power-Ltd/projects/2
6:: Run,https://github.com/issues/assigned
7:: Run,https://www.github.com
8:: Run,https://www.youtube.com
9:: Run,https://www.linkedin.com
0::
#If ; turns off the #If context above
 ;------------------------------------------------------------------------------

sc046:: rapidFireLazerGun()

;-------------------------------------------------------------------------------
; Hold X button down -> press num(0-9) -> press Button ->
; Repeat that button * num
; You won't need to tab out 10 times on Chrome/IDE to reach the text field
;-------------------------------------------------------------------------------
rapidFireLazerGun() {
    num         := ""                           ; Number of times to send
    key         := ""                           ; Key to send

    While GetKeyState("sc046", "P")             ; While button is held
    {
        Input, key, L1 T1.5                     ; Wait up to 1 sec for a  key
                                                ; to be pushed
        If (ErrorLevel = "Timeout")             ; If timeout occurs
        {
            If (num > 9 && key = "")            ; Check if number is double digits
                Loop, % SubStr(num, 1, -1)      ; Assume last number is the key to send and...
                    SendInput, % SubStr(num, 0) ; ...the numbers before it are the times to send it
            Return
        }
        Else If (key >= 0 && key <= 9)          ; If key is a number
        {
            num .= key                          ; Append it to num
            Continue                            ; Continue to get next key
        }
        Else If (num > 0 && key != "")          ; If there's a num and key
            Loop, % num                         ; Loop num times
                SendInput, % key                ; Sending key each time

        Break
    }
Return
}
  ;Fixing/repurposing Fn+function keys


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



