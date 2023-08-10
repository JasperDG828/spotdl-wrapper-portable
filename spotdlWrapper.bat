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

SET /P THREADS=Threads (Default 4): 
IF NOT DEFINED THREADS SET THREADS=4

echo.

.\python\python.exe -m spotdl --format %FORMAT% --threads %THREADS% --ffmpeg .\ffmpeg\bin\ffmpeg.exe %URL%

