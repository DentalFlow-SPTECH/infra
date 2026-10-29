# Sobe o Dental Flow completo com Docker: banco com os dados da apresentação, API Spring Boot e frontend.
# Chamado por subir.cmd. Opções: --resetar (volta o banco aos dados da apresentação) e --sem-navegador.
$ErrorActionPreference = 'Continue'
Set-Location (Split-Path $PSScriptRoot -Parent)

$resetar = $args -contains '--resetar'
$navegador = -not ($args -contains '--sem-navegador')

$config = @{}
Get-Content 'versoes.env' | Where-Object { $_ -match '^\s*([A-Z_]+)=(.*)$' } | ForEach-Object { $config[$Matches[1]] = $Matches[2].Trim() }
$porta = if ($config['WEB_PORT']) { $config['WEB_PORT'] } else { '5180' }
$url = "http://localhost:$porta"

function Falhar($mensagem) {
    Write-Host $mensagem -ForegroundColor Red
    exit 1
}

if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    Falhar 'Docker não encontrado. Instale o Docker Desktop: https://www.docker.com/products/docker-desktop/'
}
cmd /c 'docker info >nul 2>&1'
if ($LASTEXITCODE -ne 0) {
    Falhar 'O Docker Desktop não está aberto. Abra o Docker Desktop, espere ele iniciar e rode de novo.'
}
cmd /c 'docker compose version >nul 2>&1'
if ($LASTEXITCODE -ne 0) {
    Falhar "Falta o Docker Compose v2 (comando 'docker compose'). Atualize o Docker Desktop."
}

if ($resetar) {
    Write-Host 'Voltando o banco aos dados da apresentação...'
    docker compose --env-file versoes.env down -v
}

Write-Host 'Subindo banco, API e frontend (a primeira vez compila tudo e leva alguns minutos)...'
docker compose --env-file versoes.env up -d --build
if ($LASTEXITCODE -ne 0) {
    Falhar 'Não foi possível subir os containers. Veja as mensagens acima.'
}

Write-Host 'Esperando a API responder...'
$pronto = $false
for ($tentativa = 0; $tentativa -lt 100 -and -not $pronto; $tentativa++) {
    try {
        Invoke-WebRequest -UseBasicParsing -Uri "$url/dentalflow-api/v1/auth/me" -TimeoutSec 5 | Out-Null
        $pronto = $true
    }
    catch {
        $resposta = $_.Exception.Response
        if ($resposta -and [int]$resposta.StatusCode -eq 401) { $pronto = $true } else { Start-Sleep -Seconds 3 }
    }
}
if (-not $pronto) {
    Falhar 'A API não respondeu a tempo. Veja o log com: docker compose --env-file versoes.env logs backend'
}

Write-Host ''
Write-Host "Dental Flow no ar: $url" -ForegroundColor Green
Write-Host 'Entre com ana (dentista) ou carla (recepção). A senha está no README.'
Write-Host 'Para parar: parar.cmd'
if ($navegador) {
    Start-Process $url
}
