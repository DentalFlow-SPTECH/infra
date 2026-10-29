#!/usr/bin/env bash
# Sobe o Dental Flow completo com Docker: banco com os dados da apresentação, API Spring Boot e frontend.
# Uso:
#   ./subir.sh                  sobe (ou atualiza) e abre o navegador
#   ./subir.sh --resetar        descarta o que foi alterado no banco e volta aos dados da apresentação
#   ./subir.sh --sem-navegador  não abre o navegador no final
set -euo pipefail
cd "$(dirname "$0")"

resetar=false
navegador=true
for opcao in "$@"; do
    case "$opcao" in
        --resetar) resetar=true ;;
        --sem-navegador) navegador=false ;;
        *) echo "Opção desconhecida: $opcao"; exit 2 ;;
    esac
done

set -a
. ./versoes.env
set +a
url="http://localhost:${WEB_PORT:-5180}"
compose=(docker compose --env-file versoes.env)

if ! command -v docker >/dev/null 2>&1; then
    echo "Docker não encontrado. Instale: https://docs.docker.com/engine/install/"
    exit 1
fi
if ! docker info >/dev/null 2>&1; then
    echo "O Docker não está rodando (ou falta permissão). Inicie o Docker e tente de novo."
    exit 1
fi
if ! docker compose version >/dev/null 2>&1; then
    echo "Falta o Docker Compose v2 (comando 'docker compose')."
    exit 1
fi

if $resetar; then
    echo "Voltando o banco aos dados da apresentação..."
    "${compose[@]}" down -v
fi

echo "Subindo banco, API e frontend (a primeira vez compila tudo e leva alguns minutos)..."
"${compose[@]}" up -d --build

echo "Esperando a API responder..."
codigo=000
for _ in $(seq 1 100); do
    codigo=$(curl -s -o /dev/null -w '%{http_code}' "$url/dentalflow-api/v1/auth/me" || true)
    if [ "$codigo" = "401" ] || [ "$codigo" = "200" ]; then
        break
    fi
    sleep 3
done
if [ "$codigo" != "401" ] && [ "$codigo" != "200" ]; then
    echo "A API não respondeu a tempo. Veja o log com: docker compose --env-file versoes.env logs backend"
    exit 1
fi

echo
echo "Dental Flow no ar: $url"
echo "Entre com ana (dentista) ou carla (recepção). A senha está no README."
echo "Para parar: ./parar.sh"
if $navegador; then
    (xdg-open "$url" || open "$url") >/dev/null 2>&1 || true
fi
