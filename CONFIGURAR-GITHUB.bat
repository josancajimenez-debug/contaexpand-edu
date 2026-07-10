@echo off
REM Doble clic para configurar GitHub + Pages (una sola vez).
cd /d "%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0configurar-github.ps1"
echo.
pause
