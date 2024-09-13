set -o allexport; source .env; set +o allexport;

#UNATTENDED
NETFACE=0.0.0.0; #172.17.0.1
NETPORT=24306; #instead of 3306
DBPATH=./data; #$PWD/data

echo "pre-install running";

mkdir -p ./{data,sql}
chown -R 1001:1001 ./data;

sleep 10s;
if [[ "$SOFTWARE_VERSION_TAG" != "latest" && "$SOFTWARE_VERSION_TAG" != "8.0" ]]; then
  # Debug to check if the SOFTWARE_VERSION_TAG is correct
  echo "SOFTWARE_VERSION_TAG: $SOFTWARE_VERSION_TAG"
  
  # Use sed to remove '--ssl=1' from the docker-compose file
  sed -i 's/ --ssl=1//g' ./docker-compose.yml
fi

