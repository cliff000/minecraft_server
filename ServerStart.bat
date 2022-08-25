@echo off
cd ./server

cd ./logs
for /f "usebackq" %%A in (`findstr /c:"Stopping server" latest.log`) do set flag=%%A
cd ../

if "%flag%" == "" (
    echo サーバーはすでに起動しているため、起動出来ません
    pause
    
) else (
    echo サーバーを起動しています……
    java -jar server.jar
    %~dp0/zip/zip.exe -ru %userprofile%\AppData\Roaming\.minecraft\saves\sharedworld_backup world
)
