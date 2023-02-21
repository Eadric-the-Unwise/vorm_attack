call .\clean.bat

@REM    ROM+MBC5+RAM+BATT : -Wl-yt0x1B
@REM    4 ROM banks  : -Wl-yo4
@REM    4 RAM banks  : -Wl-ya4

@echo off
@REM ENTER YOUR GBDK DIRECTORY IN @set GBDK = ...
@REM -Wl-j .noi bgb debugging -Wm-yS
@set GBDK=..\..\..\gbdk
%GBDK%\bin\lcc.exe -autobank -Wf--debug -Wl-y -Wb-ext=.rel -Wb-v -Wl-yt0x1B -Wl-yoA -Wl-ya4 -o vorm-attack.gb^
 src\*.c res\tiles\*.c
@REM   strings\*.c
 


