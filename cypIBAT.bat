@echo off
SETLOCAL

:: --- Configuration ---
SET "DOWNLOAD_URL=https://github.com/MC-DESMOND/cyprelease/raw/refs/heads/master/cypINSTALL.exe"
SET "OUTPUT_FILENAME=cypINSTALL.exe"
SET "DOWNLOAD_FOLDER=%USERPROFILE%\Downloads"
:: ---------------------

SET "OUTPUT_FULL_PATH=%DOWNLOAD_FOLDER%\%OUTPUT_FILENAME%"

ECHO Checking if Downloads folder exists...
IF NOT EXIST "%DOWNLOAD_FOLDER%" (
    ECHO Error: Downloads folder not found at "%DOWNLOAD_FOLDER%".
    GOTO :EOF
)

ECHO Downloading %OUTPUT_FILENAME% to %DOWNLOAD_FOLDER% from %DOWNLOAD_URL%...

:: Download using BITSAdmin (reliable for Windows)
bitsadmin /transfer "CYPERX_INSTALLER" /download /priority HIGH "%DOWNLOAD_URL%" "%OUTPUT_FULL_PATH%"

IF %ERRORLEVEL% NEQ 0 (
    ECHO Error: Download failed! Please check the URL and your internet connection.
    GOTO :EOF
)

ECHO Download complete. Running %OUTPUT_FULL_PATH%...

:: Run the downloaded executable
start "" "%OUTPUT_FULL_PATH%"

ENDLOCAL
EXIT /B 0