@ECHO OFF
cls

echo - [1] Flash esp-rfid Firmware
echo - [2] Erase the firmware on ESP8266 by flashing empty file

set /p opt=Please choose an option eg. 1: 
set /p com=Enter which COM Port your ESP is connected eg. COM1 COM2 COM7: 

2>NUL CALL :%opt%
IF ERRORLEVEL 1 CALL :DEFAULT_CASE

:1
  esptool.exe -vv -cd nodemcu -cb 921600 -cp %com% -ca 0x00000 -cf esp-rfid.bin
  GOTO END_CASE
:2
  esptool.exe -vv -cd nodemcu -cb 921600 -cp %com% -ca 0x00000 -cf blank4mb.bin
  GOTO END_CASE
:DEFAULT_CASE
  ECHO Unknown option "%opt%"
  GOTO END_CASE
:END_CASE
  VER > NUL # reset ERRORLEVEL
  GOTO :EOF # return from CALL
