#NoEnv                      ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance FORCE       ; Skip invocation dialog box and silently replace previously executing instance of this script.
SendMode Input              ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
; #Warn                     ; Enable warnings to assist with detecting common errors.

; Youtube initial settings
DetectHiddenWindows, On
SetTitleMatchMode, 2
controlID 		:= 0
return



; If Tab is not active, it will loop through and change the tab
; Very useful for educational videos
; Youtube Default keybindings
; j = 10 secs back,    left = 5 secs back
; l = 10 secs forward, right = 5 secs forward
; k = pause
;-------------------------------------------------------------------------------
sendKeyOnChrome(key, title, tabName)
{
#IfWinNotActive, ahk_exe chrome.exe
	ControlGet, controlID, Hwnd,,Chrome_RenderWidgetHostHWND1, %title%
	ControlFocus,,ahk_id %controlID%
	IfWinExist, %tabName%
	{
		ControlSend, Chrome_RenderWidgetHostHWND1, %key%, %title%
		return
	}
	Loop, 20
	{
		IfWinExist, %tabName%
			break
		ControlSend, , ^{PgUp} , %title%
		; uncomment sleep if computer is slow on picking up the tab on change
		; sleep 150
	}
	ControlSend, , %key% , %title%
 Return
 #IfWinNotActive
}

~CapsLock up::SetCapsLockState,Off
#If GetKeyState("Capslock","P")
j:: sendKeyOnChrome("{left}", "Google Chrome", "YouTube")  ; Seek back 10secs
+j:: sendKeyOnChrome("j", "Google Chrome", "YouTube")      ; Seek back  5secs
l:: sendKeyOnChrome("{right}", "Google Chrome", "YouTube") ; Seek forw  5secs
+l:: sendKeyOnChrome("l", "Google Chrome", "YouTube")      ; Seek forw 10secs
