# Dental Flow — infra

Sobe o sistema inteiro com um comando, igual para toda a equipe: **MySQL com os dados da apresentação**, **API Spring Boot** e **frontend React**. Só é preciso ter o Docker.

## Requisitos

- **Windows:** [Docker Desktop](https://www.docker.com/products/docker-desktop/) aberto.
- **Linux:** Docker Engine com o Compose v2 (`docker compose`) e o `curl`. O usuário precisa poder rodar `docker` sem `sudo`.
- Internet na primeira vez: as imagens baixam o código do backend e do frontend direto do GitHub.

## Subir

| Sistema | Como |
| --- | --- |
| Windows | Dois cliques em **`subir.cmd`** |
| Linux / macOS | `./subir.sh` |

A primeira subida compila o backend e o frontend e leva alguns minutos; as seguintes levam segundos. No fim, o navegador abre em **http://localhost:5180**.

**Usuários:** `ana` (dentista, vê tudo) e `carla` (recepção). Senha dos dois: `senha123`. São dados fictícios, só para demonstração.

| Opção | O que faz |
| --- | --- |
| `--resetar` | Descarta o que foi alterado no banco (consultas confirmadas, agendamentos de treino) e volta aos dados da apresentação. Use antes de apresentar. |
| `--sem-navegador` | Não abre o navegador no final. |

Exemplos: `subir.cmd --resetar` (Windows, pelo terminal) ou `./subir.sh --resetar`.

**Parar:** `parar.cmd` ou `./parar.sh`. Os dados alterados ficam guardados para a próxima subida, até um `--resetar`.

## O que sobe

| Serviço | Imagem | Endereço no seu computador |
| --- | --- | --- |
| `web` | nginx com o frontend compilado; repassa `/dentalflow-api` para a API | http://localhost:5180 |
| `backend` | API Spring Boot (Java 21) | só por dentro, via `web` |
| `db` | MySQL 8.4 com o banco `dentalFlow` preenchido | `localhost:3308` (usuário `root`, senha em `versoes.env`) |

As portas e as versões ficam em **`versoes.env`**. O backend e o frontend são fixados por commit (`BACKEND_REF` e `FRONTEND_REF`), para que todos subam exatamente o mesmo código da apresentação. Para usar outra versão, troque o commit e rode `subir` de novo.

Os dados do banco estão em `docker/db/dentalflow.sql`: estrutura, a view do painel e os dados da demonstração (49 pacientes, consultas de agosto a novembro de 2026, mapas do dia de agosto a outubro para os três dentistas, 24 materiais e 8 equipamentos). O MySQL carrega esse arquivo só quando o volume está vazio: na primeira subida ou depois de `--resetar`.

## Atualizar os dados da imagem

Para levar para a equipe o estado atual de um banco local (container `dentalflow-mysql`):

```bash
docker exec dentalflow-mysql sh -c 'MYSQL_PWD="$MYSQL_ROOT_PASSWORD" exec mysqldump -uroot --databases dentalFlow --single-transaction --routines --triggers --set-gtid-purged=OFF --no-tablespaces --default-character-set=utf8mb4 --skip-dump-date' > docker/db/dentalflow.sql
```

Depois, faça o commit. Cada pessoa roda `subir` com `--resetar` para carregar os dados novos.

## Problemas comuns

- **Porta em uso:** troque `WEB_PORT` ou `DB_PORT` em `versoes.env`.
- **A API não respondeu a tempo:** veja o log com `docker compose --env-file versoes.env logs backend`.
- **Datas:** os dados giram em torno de 29/10/2026. Em outro dia, a tela Hoje mostra o dia atual; use a Agenda para ir à semana da demonstração.
