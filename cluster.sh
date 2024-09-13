#NODE [INDEX]
echo "Multi-master of [OTHER_NODE_GLOBAL_IP]:[OTHER_NODE_PORT]" > /opt/clustermode.conf
## Change .env
sed -i "/CLUSTER_OPTIONS=/c\CLUSTER_OPTIONS=--server-id=\[NODE_ID] --report-host=[NODE_CNAME] --auto-increment-increment=2 --auto-increment-offset=[INDEX]" /opt/app/.env
cd /opt/app;
docker-compose down;
rm -rf data/auto.cnf
docker-compose up -d;
sleep 15s;
## Configure replication
docker-compose exec -T mysql mysql -h 172.17.0.1 --port [NODE_PORT] -u [NODE_USER] -p[NODE_PASSWORD] -e "stop replica;"
docker-compose exec -T mysql mysql -h 172.17.0.1 --port [NODE_PORT] -u [NODE_USER] -p[NODE_PASSWORD] -e "CHANGE REPLICATION SOURCE TO SOURCE_HOST=\\"[OTHER_NODE_GLOBAL_IP]\\", SOURCE_PORT=[OTHER_NODE_PORT], SOURCE_USER=\\"[OTHER_NODE_USER]\\", SOURCE_PASSWORD=\\"[OTHER_NODE_PASSWORD]\\", SOURCE_AUTO_POSITION=1;"
docker-compose exec -T mysql mysql -h 172.17.0.1 --port [NODE_PORT] -u [NODE_USER] -p[NODE_PASSWORD] -e "reset replica;"
docker-compose exec -T mysql mysql -h 172.17.0.1 --port [NODE_PORT] -u [NODE_USER] -p[NODE_PASSWORD] -e "start replica;"
docker-compose exec -T mysql mysql -h 172.17.0.1 --port [NODE_PORT] -u [NODE_USER] -p[NODE_PASSWORD] -e "show replica status;"