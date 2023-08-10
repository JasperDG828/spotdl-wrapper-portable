@echo off
setlocal enabledelayedexpansion
type ascii.txt

echo python version:
.\python\python.exe --version

echo.

echo SpotDL version:
.\python\python.exe -m spotdl -v

echo.

set /p URL=Enter Spotify URL (right-click to paste): 

echo 1. mp3   4. opus
echo 2. flac  5. m4a
echo 3. ogg   6. wav
set /P FORMATN=Select output format (Default mp3): 
IF NOT DEFINED FORMATN SET FORMATN=1
IF %FORMATN%==1 SET FORMAT=mp3
IF %FORMATN%==2 SET FORMAT=flac
IF %FORMATN%==3 SET FORMAT=ogg
IF %FORMATN%==4 SET FORMAT=opus
IF %FORMATN%==5 SET FORMAT=m4a
IF %FORMATN%==6 SET FORMAT=wav

echo.

echo 0. auto
echo 1. 8kbps   4. 128kbps
echo 2. 16kbps  5. 256kbps
echo 3. 64kbps  6. 320kbps
echo (Anything under 128kbps is considered horrible)
set /P BITRATEN=Select bitrate (Default 320kbps): 
IF NOT DEFINED BITRATEN SET BITRATEN=6
IF %BITRATEN%==1 SET BITRATE=8k
IF %BITRATEN%==2 SET BITRATE=16k
IF %BITRATEN%==3 SET BITRATE=64k
IF %BITRATEN%==4 SET BITRATE=128k
IF %BITRATEN%==5 SET BITRATE=256k
IF %BITRATEN%==6 SET BITRATE=320k
IF %BITRATEN%==0 SET BITRATE=auto

echo.

SET /P THREADS=Threads (Default 4): 
IF NOT DEFINED THREADS SET THREADS=4

echo.

.\python\python.exe -m spotdl --format %FORMAT% --threads %THREADS% --ffmpeg .\ffmpeg\bin\ffmpeg.exe --bitrate %BITRATE% %URL%

