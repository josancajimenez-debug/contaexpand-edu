@echo off
REM Ejecuta la suite de pruebas de regresion de ContaExpand Edu.
cd /d "%~dp0"
where node >nul 2>nul
if errorlevel 1 (
  echo.
  echo Node.js no esta instalado. Descargalo de https://nodejs.org y vuelve a intentar.
  echo.
  pause
  exit /b 1
)
node "pruebas\verificar.js"
echo.
pause
