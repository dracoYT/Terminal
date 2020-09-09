@echo off
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
set tname=terminal
set lang=EN
REM Lang can be [ES, EN, FR, PT] for [Español, English, Français, Português
set color-g=Term
:: Color Gammas [Term, Water, Light, Custom]
::Custom ________________________________________________________
    if color-g EQU "Custom" (
         set g_solid=07
         set g_warn=0e
         set g_succes=0a
         set g_error=0c
	     set g_cmdname=03
	     color %g_solid%
    	) ELSE (goto :flie-s)
:: Presets (Dont edit)
	 if color-g EQU "Term" (
         set g_solid=0f
         set g_warn=0e
         set g_succes=0a
         set g_error=0c
         set g_cmdname=0b
color %g_solid%
    	)
	  if color-g EQU "Water" (
         set g_solid=07
         set g_warn=0c
         set g_succes=0a
         set g_error=0b
         set g_cmdname=03
color %g_solid%
    	) ELSE (goto :flie-s)

	  	  if color-g EQU "Light" (
         set g_solid=f0
         set g_warn=f6
         set g_succes=f2
         set g_error=fc
         set g_cmdname=03
color %g_solid%
    	) ELSE (goto :flie-s)







::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:file-s
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)
SET PAT=!local_path!
IF EXIST C:\Program Files\Draco-Github\terminal\user.jvs (goto logged_true) ELSE (
	::-------Files Installation-------::
	echo Installing data in the program path...
	cd "C:/Program Files">nul
	md Draco-Github>nul
	cd "C:/Program Files/Draco-Github">nul
	touch Draco-Github/terminal/commands>nul
	cd "C:/Program Files/Draco-Github/terminal">nul
	md bin>nul
	echo 1>>user.jvs>nul
	cd /bin
	git clone https://github.com/dracoYT/Terminal.git && msg * "Error, install ^"Git^" to continue!"
	::---------------------------------::
	)

:time
echo time: %time% 
echo date: %date% 
goto :promp-t
:logged_true
echo.
call :colortext 0A "Hello, Welcome to %tname%"
echo.
echo
echo
goto :promp-t
:promp-t
call :colortext %g_succes% "%username%@%computername%"
call :colortext 07 ":"
call :colortext 09 "~[%cd%]"
set /p cmp= 

exit /b
:colortext
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1