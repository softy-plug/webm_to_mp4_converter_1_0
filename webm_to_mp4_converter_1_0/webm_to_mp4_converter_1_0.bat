::[FFmpeg webm_to_mp4_converter_1_0 softy_plug]
@echo off

:again

mkdir out_mp4
for %%i in (*.webm) do (
  ffmpeg -i "%%i" -c:v libx264 -preset slower -r 24 -crf 22 -c:a aac -b:a 320k -ac 2 -ar 44100 -vf scale=-2:1080 "out_mp4/%%~ni.mp4"
)

::[FFmpeg webm_to_mp4_converter_1_0 softy_plug]

if NOT ["%errorlevel%"]==["0"] goto:error
echo [92m%~n1 Done.[0m
shift
if "%~1" == "" goto:end
goto:again
:error

echo [93mError! Video files to encode were not found. Check for video files in the folder with the executable .exe file.[0m
pause
exit 0
:end

cls
echo [92mEncoding succesful. This window will close after 10 seconds.[0m
timeout /t 10


::[FFmpeg webm_to_mp4_converter_1_0 softy_plug]
