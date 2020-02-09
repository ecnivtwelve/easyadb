@echo off
cd /D "%~dp0"

:need
cls
echo EasyAdb 1.0
echo by ecnivtwelve
echo for Daisy - Mi A2 Lite
echo ------------------------------------
echo What do you need ?
echo 1) fastboot
echo 2) adb
echo ------------------------------------
set /p nd=Enter the number : 
if %nd% EQU 1 goto fst
if %nd% EQU 2 goto snd
goto need

:fst
cls
echo EasyAdb 1.0
echo by ecnivtwelve
echo for Daisy - Mi A2 Lite
echo ------------------------------------
echo What do you need ?
echo 1) Show a list of connected devices
echo 2) Flash a splash called splash.img
echo 3) Boot a file
echo 4) Enter EDL mode
echo ------------------------------------
set /p nd=Enter the number : 
if %nd% EQU 1 fastboot devices
if %nd% EQU 2 fastboot flash splash splash.img
if %nd% EQU 3 goto bfi
if %nd% EQU 4 fastboot reboot edl
goto need

:snd
cls
echo EasyAdb 1.0
echo by ecnivtwelve
echo for Daisy - Mi A2 Lite
echo ------------------------------------
echo What do you need ?
echo 1) Show a list of connected devices
echo 2) Transfer a file to /sdcard
echo 3) Show Android Logs (logcat)
echo 4) Install an .apk file
echo 5) Advanced reboot
echo ------------------------------------
set /p nd=Enter the number : 
if %nd% EQU 1 adb devices
if %nd% EQU 2 goto tfil
if %nd% EQU 3 goto lgct
if %nd% EQU 4 goto iapk
if %nd% EQU 5 goto are
goto need




:tfil
echo ------------------------------------
set /p fna=File name : 
echo ------------------------------------
adb push %fna% /sdcard
goto need

:bfi
echo ------------------------------------
set /p fna=File name : 
echo ------------------------------------
fastboot boot %fna%
goto need

:iapk
echo ------------------------------------
set /p fna=File name : 
echo ------------------------------------
adb install %fna%
goto need

:lgct
echo ------------------------------------
adb logcat

:are
echo ------------------------------------
echo What do you need ?
echo 1) Reboot system
echo 2) Reboot to bootoader
echo 3) Reboot to recovery
echo 4) Reboot to EDL (not tested)
echo ------------------------------------
set /p nd=Enter the number : 
if %nd% EQU 1 adb reboot
if %nd% EQU 2 adb reboot bootloader
if %nd% EQU 3 adb reboot recovery
if %nd% EQU 4 adb reboot edl
goto need