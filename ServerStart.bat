@echo off
cd ./server

cd ./logs
for /f "usebackq" %%A in (`findstr /c:"Stopping server" latest.log`) do set flag=%%A
cd ../

if "%flag%" == "" (
    echo �T�[�o�[�͂��łɋN�����Ă��邽�߁A�N���o���܂���
    pause
    
) else (
    echo �T�[�o�[���N�����Ă��܂��c�c
    java -jar server.jar
    %~dp0/zip/zip.exe -ru %userprofile%\AppData\Roaming\.minecraft\saves\sharedworld_backup world
)
