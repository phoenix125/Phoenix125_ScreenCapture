#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Resources\print_screen-Cropped.ico
#AutoIt3Wrapper_Outfile=Builds\Phoenix125_ScreenCapture_v1.0.exe
#AutoIt3Wrapper_Res_Comment=http://www.Phoenix125.com
#AutoIt3Wrapper_Res_Description=Phoenix125's Screen Capture
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_ProductName=Phoenix125_ScreenCapture
#AutoIt3Wrapper_Res_ProductVersion=v1.0.0
#AutoIt3Wrapper_Res_CompanyName=http://www.Phoenix125.com
#AutoIt3Wrapper_Res_LegalCopyright=http://www.Phoenix125.com
#AutoIt3Wrapper_Run_AU3Check=n
#AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_Run_Tidy=y
#AutoIt3Wrapper_Run_Au3Stripper=y
#Au3Stripper_Parameters=/mo
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <ScreenCapture.au3>
HotKeySet("{PRINTSCREEN}", "RunPaint")

$aUtilFile = @ScriptDir & "\Phoenix125_ScreenCapture.ini"
If FileExists($aUtilFile) = 0 Then
	Global $aSaveFolder = FileSelectFolder("Phoenix125 Screen Capture - SELECT SAVE FOLDER", @ScriptDir, 1 + 2 + 4, @ScriptDir)
	IniWrite($aUtilFile, "CFG", "SaveFolder", $aSaveFolder)
Else
	Global $aSaveFolder = IniRead($aUtilFile, "CFG", "SaveFolder", @ScriptDir)
EndIf
If FileExists($aSaveFolder) = 0 Then DirCreate($aSaveFolder)

Dim $binFlag = False
SplashTextOn("Phoenix125 Screen Capture", "Screen Capture program running." & @CRLF & @CRLF & "Save Folder:" & @CRLF & $aSaveFolder, 500, 110)
Sleep(5000)
SplashOff()
Do
	Sleep(100)
Until $binFlag = True

Func RunPaint()
	Local $tTime = @YEAR & "-" & @MON & "-" & @MDAY & "_" & @HOUR & "-" & @MIN
	$tFile = $aSaveFolder & "\ScreenCapture_" & $tTime & ".bmp"
	_ScreenCapture_Capture($tFile, 0, 0, -1, -1, False)
	Run("mspaint.exe")
	Sleep(2000)
	Send("^o")
	Sleep(200)
	Send($tFile & "{ENTER}")
EndFunc   ;==>RunPaint
