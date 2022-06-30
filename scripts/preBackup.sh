#set env vars
set -o allexport; source .env; set +o allexport;

#do a consistent dump before files are copied
docker-compose exec -T mysql /usr/bin/mysqldump --no-tablespaces --set-gtid-purged=OFF --user=root --password=$SOFTWARE_PASSWORD --all-databases | gzip > ./lastDump.sql.gz