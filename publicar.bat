@echo off
REM ============================================================
REM  Sube a GitHub todos los cambios de ContaExpand Edu.
REM  Doble clic para publicar. GitHub Pages se actualiza solo.
REM ============================================================
cd /d "%~dp0"

echo Guardando y subiendo cambios a GitHub...
git add -A
git commit -m "Actualizacion %date% %time%"
git push

echo.
echo ------------------------------------------------------------
echo Listo. En 1-2 minutos el sitio en GitHub Pages queda actualizado.
echo (Si pidio usuario/clave, era el inicio de sesion de GitHub.)
echo ------------------------------------------------------------
pause
