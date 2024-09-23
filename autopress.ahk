#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for faster and more reliable sending of keystrokes.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent working directory.

; Initialize a flag to track whether the auto-press is active
isAutoPressActive := false

; Define the hotkey for '3' with the tilde (~) to allow the original key press
~3::
    if (!isAutoPressActive) {
        isAutoPressActive := true
        SetTimer, Press3, 300  ; Set a timer to call Press3 every 1000 milliseconds (1 second)
        ToolTip, Auto-Pressing '3' started. Press 'z' to stop.
        ; Optional: Play a sound or provide additional feedback
    }
    return

; Define the hotkey for 'z' to stop auto-pressing
z::
    if (isAutoPressActive) {
        SetTimer, Press3, Off  ; Turn off the timer
        isAutoPressActive := false
        ToolTip, Auto-Pressing '3' stopped.
        Sleep, 1000  ; Display the tooltip for 1 second
        ToolTip  ; Remove the tooltip
        ; Optional: Play a sound or provide additional feedback
    }
    return

; Define the function that sends '3'
Press3:
    Send, 3
    return

; Optional: Exit script with a specific key combination (e.g., Ctrl+Esc)
^Esc::
    ExitApp
    return
