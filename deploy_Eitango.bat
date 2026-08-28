@echo off
title Eitango Deploy Tool

cd /d "%~dp0"

echo [1/3] Git add...
git add .
if %errorlevel% neq 0 goto error_end

echo [2/3] Git commit...
set "commit_msg=Update Eitango"
git commit -m "%commit_msg%"

echo [3/3] Git push...
git push origin main
if %errorlevel% neq 0 (
    echo [INFO] Retrying with master branch...
    git push origin master
)
if %errorlevel% neq 0 goto error_end

echo ===================================================
echo  Deployment complete!
echo ===================================================
goto end

:error_end
echo [ERROR] Deployment failed during process.

:end
echo.
pause
