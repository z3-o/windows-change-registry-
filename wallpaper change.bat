@echo off

set "dialog=about:<input type=file id=FILE accept='.jpg,.jpeg,.png'><script>FILE.click();new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1).WriteLine(FILE.value);close();resizeTo(0,0);</script>"

for /f "tokens=* delims=" %%p in ('mshta.exe "%dialog%"') do set "file=%%p"

if defined file (
    REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%file%" /f
    echo successfully changed wallpaper.
) else (
    echo Select file.
)

pause