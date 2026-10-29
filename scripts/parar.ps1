# Para o Dental Flow. Os dados do banco continuam guardados para a próxima subida. Chamado por parar.cmd.
Set-Location (Split-Path $PSScriptRoot -Parent)
docker compose --env-file versoes.env down
Write-Host 'Dental Flow parado. Para subir de novo: subir.cmd'
