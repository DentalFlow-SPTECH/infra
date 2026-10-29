#!/usr/bin/env bash
# Para o Dental Flow. Os dados do banco continuam guardados para a próxima subida.
set -euo pipefail
cd "$(dirname "$0")"
docker compose --env-file versoes.env down
echo "Dental Flow parado. Para subir de novo: ./subir.sh"
