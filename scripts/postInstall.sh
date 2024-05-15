#set env vars
set -o allexport; source .env; set +o allexport;

#write cli helper
echo "docker-compose exec mysql mysql --host=172.17.0.1 --port=24306 --user=root --password=${SOFTWARE_PASSWORD}" > mysql-docker-cli.sh;
chmod +x mysql-docker-cli.sh;

#create backup folder
mkdir -p /opt/app-backups

#write backup helper
echo "docker-compose exec mysql /usr/bin/mysqldump --no-tablespaces --set-gtid-purged=OFF --user=root --password=${SOFTWARE_PASSWORD} --all-databases | gzip > /opt/app-backups/DB_\$(date +%Y-%m-%d-%H.%M.%S).sql.gz" > backupDB.sh;
chmod +x backupDB.sh;

#write restore from dump helper
cat > restoreDB-Dump.sh << EOT
if [ -z "$1" ]
 then
echo "You must pass 1 parameter: full path to your SQL backup to restore"
 else
gunzip < $1 | docker-compose exec -T mysql /usr/bin/mysql --binary-mode --user=root --password=${SOFTWARE_PASSWORD}
fi
EOT
chmod +x restoreDB-Dump.sh;

sleep 25s;
docker-compose down
openssl req -new -x509 -days 3650 -nodes -text -out ./data/server-cert.pem -keyout ./data/server-key.pem -subj "/CN=${CNAME}"
sleep 5s;
sed -i 's/#--ssl/--ssl/' docker-compose.yml
docker-compose up -d;