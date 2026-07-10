# Configura el repositorio en GitHub y activa GitHub Pages (una sola vez).
# Requiere GitHub CLI (ya instalado). Al ejecutarlo se abrira el navegador
# para que inicies sesion en TU cuenta de GitHub.

$ErrorActionPreference = "Stop"
$gh = "C:\Program Files\GitHub CLI\gh.exe"
if (-not (Test-Path $gh)) { $gh = "gh" }

Write-Host "== 1/4  Verificando sesion de GitHub ==" -ForegroundColor Cyan
& $gh auth status 2>$null
if ($LASTEXITCODE -ne 0) {
  Write-Host "No hay sesion. Se abrira el navegador para iniciar sesion en GitHub."
  Write-Host "Elige:  GitHub.com  ->  HTTPS  ->  Login with a web browser."
  & $gh auth login
}

Write-Host "`n== 2/4  Creando el repositorio y subiendo el proyecto ==" -ForegroundColor Cyan
# Crea el repo PUBLICO con el nombre contaexpand-edu, agrega 'origin' y sube 'main'.
& $gh repo create contaexpand-edu --public --source=. --remote=origin --push

Write-Host "`n== 3/4  Activando GitHub Pages (rama main / raiz) ==" -ForegroundColor Cyan
try {
  & $gh api --method POST "repos/{owner}/{repo}/pages" -f "source[branch]=main" -f "source[path]=/" 2>$null
} catch {
  Write-Host "  (Si ya estaba activo o requiere activarlo a mano: Settings -> Pages -> Deploy from a branch -> main / root)"
}

Write-Host "`n== 4/4  Obteniendo el enlace publico ==" -ForegroundColor Cyan
Start-Sleep -Seconds 3
$url = ""
try { $url = (& $gh api "repos/{owner}/{repo}/pages" --jq ".html_url" 2>$null) } catch {}

Write-Host "`n===============================================" -ForegroundColor Green
if ($url) {
  Write-Host "LISTO. Enlace del sitio (activo en 1-2 minutos):" -ForegroundColor Green
  Write-Host "  $url" -ForegroundColor Yellow
} else {
  Write-Host "Repo creado y subido. Activa Pages en:" -ForegroundColor Green
  Write-Host "  GitHub -> Settings -> Pages -> Deploy from a branch -> main / root"
}
Write-Host "A partir de ahora, usa 'publicar.bat' para subir cambios." -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green
