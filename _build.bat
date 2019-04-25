@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"


goto build

:build
cd %~dp0
call npm run-script build
goto start

:start
    echo.
    echo.
    echo         ####   ###  #  ##   #####     #####  ##   ##  #####       ####   #####  #####  #    #  ####
    echo       #        #   # ##    #         #       ## ##   #          #       #        #    #    #  #   #
    echo       ####    #   ##      ####      ####      #     ####        ####   ####     #    #    #  ####
    echo          #   #   # ##    #         #       ## ##   #               #  #        #    #    #  #
    echo     ####   ###  #  ##   #####  #  #####  ##   ##  #####       ####   #####    #     ####   #
    echo.
    echo.
    echo Sike Setup will walk you through the setup of sike.exe.
    goto shortcutQF

:shortcutQF
    echo.
    set /p input= Do you want a shortcut to be created? (y/n) 
    if %input% == n goto ready
    if %input% == y goto shortcut

:shortcutQ
    echo.
    set /p input= Do you want another shortcut to be created? (y/n) 
    if %input% == n goto ready
    if %input% == y goto shortcut

:shortcut
    echo.
    set /p sc= What should the shortcut be named? (string) 
    mklink %CD%\sike-win32-x64\%sc% %CD%\sike-win32-x64\sike.exe
    echo.
    set /p input= Should the shortcut be moved to another directory? (y/n) 
    if %input% == n goto ready
    if %input% == y goto move

:move
    echo.
    set /p input= Where should the shortcut be moved to? (path) (string) 
    move %CD%\sike-win32-x64\%sc% %input%
    goto shortcutQ

:ready
    echo.
    echo Your setup is ready.
    echo You will exit sike setup by pressing any key.
    pause
    exit