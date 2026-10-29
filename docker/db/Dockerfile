# MySQL 8.4 com o banco dentalFlow da apresentação. Na primeira subida (volume vazio), o MySQL
# carrega dentalflow.sql: estrutura, view do painel e dados fictícios da demonstração.
FROM mysql:8.4
ENV MYSQL_DATABASE=dentalFlow \
    TZ=America/Sao_Paulo
COPY dentalflow.sql /docker-entrypoint-initdb.d/01_dentalflow.sql
