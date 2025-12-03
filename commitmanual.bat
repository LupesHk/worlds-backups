@echo off
title Commit Simples

SET "GIT=%~dp0git\bin\git.exe"
SET "BRANCH=main"

if exist "password.env" (
    for /f "usebackq tokens=1,2 delims==" %%a in ("password.env") do (
        if "%%a"=="GIT_TOKEN" set "GIT_TOKEN=%%b"
    )
)

SET "REPO_TOKEN=https://%GIT_TOKEN%@github.com/LupesHk/worlds-backups.git"

echo Commit rapido...
"%GIT%" remote set-url origin "%REPO_TOKEN%"
"%GIT%" add .
"%GIT%" commit -m "Update %date% %time%" --allow-empty
"%GIT%" push origin %BRANCH% --force

echo Concluido!
pause