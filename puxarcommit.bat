@echo off
title Puxar Commit Especifico do Git

REM Caminho relativo ao executável do Git
SET "GIT=%~dp0git\bin\git.exe"

REM Caminho da pasta do repositório
SET "REPO_DIR=%~dp0world"

echo ===============================
echo   PUXAR COMMIT ESPECÍFICO
echo ===============================
echo.

echo Digite o hash do commit (pode ser parcial):
set /p COMMIT_HASH="> "

echo.
echo Confirmando: %COMMIT_HASH%
echo.

REM Ir para o repositório
pushd "%REPO_DIR%"

echo Fazendo fetch do remoto...
"%GIT%" fetch origin

echo.
echo Resetando localmente para o commit escolhido...
"%GIT%" reset --hard %COMMIT_HASH%

echo.
echo PRONTO!
echo O repositório agora está exatamente no commit:
echo %COMMIT_HASH%

popd
pause
