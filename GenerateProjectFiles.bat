@echo off
REM JaMarket - Generate Unreal Engine 5.8 Project Files
setlocal enabledelayedexpansion

echo ========================================
echo JaMarket - Project File Generator
echo ========================================
echo.

REM Get the directory where this script is located
set SCRIPT_DIR=%~dp0
cd /d "%SCRIPT_DIR%"

echo Current directory: %SCRIPT_DIR%
echo.

REM Look for UE5.8 installation
echo Searching for Unreal Engine 5.8...

REM Try default Epic Games installation path
set "UE_PATH=C:\Program Files\Epic Games\UE_5.8"

if not exist "%UE_PATH%" (
    echo Warning: Default UE5.8 path not found
    echo Trying registry lookup...
    
    REM Try registry (requires admin, might not work)
    for /f "tokens=2*" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\EpicGames\Unreal Engine\5.8" /v "InstalledDirectory" 2^>nul') do (
        set "UE_PATH=%%B"
    )
)

if not exist "%UE_PATH%" (
    echo.
    echo ERROR: Could not find Unreal Engine 5.8!
    echo Please make sure UE5.8 is installed at:
    echo   C:\Program Files\Epic Games\UE_5.8
    echo.
    pause
    exit /b 1
)

echo Found: %UE_PATH%
echo.
echo Generating Visual Studio project files...
echo.

REM Run the UE5 project file generator
"%UE_PATH%\Engine\Build\BatchFiles\GenerateProjectFiles.bat" -vs2022 "%SCRIPT_DIR%JAMARKET.uproject"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo SUCCESS! Project files generated.
    echo ========================================
    echo.
    echo Next steps:
    echo 1. Open JAMARKET.sln in Visual Studio
    echo 2. Build the solution (Ctrl+Shift+B)
    echo 3. Open JAMARKET.uproject in Unreal Engine
    echo.
    pause
) else (
    echo.
    echo ERROR: Project file generation failed!
    echo Error code: %ERRORLEVEL%
    echo.
    pause
    exit /b %ERRORLEVEL%
)
