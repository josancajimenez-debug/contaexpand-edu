# Configura el repositorio en GitHub y activa GitHub Pages (una sola vez).
# Requiere GitHub CLI (ya instalado). Al ejecutarlo se abrira el navegador
# para que inicies sesion en TU cuenta de GitHub.
#
# Nota: NO usar $ErrorActionPreference = "Stop": en PowerShell 5.1 el texto que
# gh escribe en stderr se convertiria en error fatal y cortaria el script.

$gh = "C:\Program Files\GitHub CLI\gh.exe"
if (-not (Test-Path $gh)) { $gh = "gh" }

Write-Host "== 1/4  Verificando sesion de GitHub ==" -ForegroundColor Cyan
& $gh auth status 2>$null | Out-Null
if ($LASTEXITCODE -ne 0) {
  Write-Host "No hay sesion. Iniciando el proceso de inicio de sesion..." -ForegroundColor Yellow
  Write-Host "Cuando pregunte, elige con las flechas:" -ForegroundColor Yellow
  Write-Host "   GitHub.com   ->   HTTPS   ->   Login with a web browser" -ForegroundColor Yellow
  Write-Host "Luego copia el codigo que aparece y pegalo en el navegador." -ForegroundColor Yellow
  Write-Host ""
  & $gh auth login
  & $gh auth status 2>$null | Out-Null
  if ($LASTEXITCODE -ne 0) {
    Write-Host "`nNo se completo el inicio de sesion. Vuelve a ejecutar este archivo." -ForegroundColor Red
    return
  }
}
Write-Host "Sesion de GitHub verificada." -ForegroundColor Green

Write-Host "`n== 2/4  Creando el repositorio y subiendo el proyecto ==" -ForegroundColor Cyan
& git remote get-url origin 2>$null | Out-Null
if ($LASTEXITCODE -ne 0) {
  & $gh repo create contaexpand-edu --public --source=. --remote=origin --push
  if ($LASTEXITCODE -ne 0) {
    Write-Host "`nNo se pudo crear o subir el repositorio. Revisa el mensaje de arriba." -ForegroundColor Red
    return
  }
} else {
  Write-Host "El remoto 'origin' ya existe; subiendo cambios..." -ForegroundColor Yellow
  & git push -u origin main
}

Write-Host "`n== 3/4  Activando GitHub Pages (rama main / raiz) ==" -ForegroundColor Cyan
& $gh api --method POST "repos/{owner}/{repo}/pages" -f "source[branch]=main" -f "source[path]=/" 2>$null | Out-Null

Write-Host "`n== 4/4  Obteniendo el enlace publico ==" -ForegroundColor Cyan
Start-Sleep -Seconds 3
$url = ""
$url = (& $gh api "repos/{owner}/{repo}/pages" --jq ".html_url" 2>$null)

Write-Host "`n===============================================" -ForegroundColor Green
if ($url) {
  Write-Host "LISTO. Enlace del sitio (activo en 1-2 minutos):" -ForegroundColor Green
  Write-Host "  $url" -ForegroundColor Yellow
} else {
  Write-Host "Repo creado y subido." -ForegroundColor Green
  Write-Host "Si el enlace no aparecio, activa Pages a mano:" -ForegroundColor Green
  Write-Host "  GitHub -> Settings -> Pages -> Deploy from a branch -> main / root"
}
Write-Host "A partir de ahora, usa 'publicar.bat' para subir cambios." -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green
