# Zenith Audience(TM) · Auto-installer · Windows PowerShell

$ErrorActionPreference = "Stop"

Write-Host "================================================" -ForegroundColor Magenta
Write-Host "      Zenith Audience(TM) Installer v1.0.0     " -ForegroundColor Magenta
Write-Host "================================================" -ForegroundColor Magenta
Write-Host ""

# 1. Verificar Claude Code
if (-not (Get-Command claude -ErrorAction SilentlyContinue)) {
    Write-Host "[!] Claude Code no detectado. Instalalo primero:" -ForegroundColor Cyan
    Write-Host "    https://claude.com/claude-code"
    exit 1
}
Write-Host "[OK] Claude Code detectado" -ForegroundColor Green

# 2. Crear directorio plugins
$PluginsDir = "$env:USERPROFILE\.claude\plugins"
New-Item -ItemType Directory -Path $PluginsDir -Force | Out-Null
Write-Host "[OK] Directorio plugins creado" -ForegroundColor Green

# 3. Clonar el repo
$Target = "$PluginsDir\zenith-audience"
if (Test-Path $Target) {
    Write-Host "[!] Zenith Audience ya existe. Actualizando..." -ForegroundColor Cyan
    Set-Location $Target
    git pull
} else {
    git clone https://github.com/zenithmetodo/zenith-audience.git $Target
}
Write-Host "[OK] Repo descargado" -ForegroundColor Green

# 4. Instalar deps Python (opcional)
if (Get-Command pip -ErrorAction SilentlyContinue) {
    Write-Host "-> Instalando dependencias Python opcionales..." -ForegroundColor Cyan
    pip install -r "$Target\requirements.txt" --quiet
    Write-Host "[OK] Python deps instaladas" -ForegroundColor Green
}

# 5. Copiar .env.example
if (-not (Test-Path "$Target\.env")) {
    Copy-Item "$Target\.env.example" "$Target\.env" -ErrorAction SilentlyContinue
    Write-Host "[OK] .env creado - editalo con tus tokens" -ForegroundColor Green
}

Write-Host ""
Write-Host "================================================" -ForegroundColor Magenta
Write-Host "[OK] Zenith Audience instalado correctamente" -ForegroundColor Green
Write-Host "================================================" -ForegroundColor Magenta
Write-Host ""
Write-Host "Proximos pasos:" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. Configura Metricool MCP (metricas - gratis):"
Write-Host "   claude mcp add --transport http metricool https://ai.metricool.com/mcp"
Write-Host ""
Write-Host "2. (Opcional) Configura Apify MCP (research - free `$5/mes):"
Write-Host "   Token en https://console.apify.com/account/integrations"
Write-Host "   claude mcp add --transport http apify https://mcp.apify.com --header `"Authorization=Bearer YOUR_TOKEN`""
Write-Host ""
Write-Host "3. Edita .env con tus tokens:"
Write-Host "   notepad $Target\.env"
Write-Host ""
Write-Host "4. Reinicia Claude Code y prueba:"
Write-Host "   /audience-ideas"
Write-Host ""
Write-Host "Docs completas: $Target\INSTALL.md" -ForegroundColor Magenta
