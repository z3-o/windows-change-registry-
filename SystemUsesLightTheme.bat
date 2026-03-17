@echo off

for /f "tokens=3" %%a in ('reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme') do set "x=%%a"
set /a "num=!x"
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d %num% /f
echo successfully changed SystemUsesLightTheme.