echo 'vm.max_map_count=512000' >> /etc/sysctl.conf && sysctl -p

mkdir -p ./data;
chown -R 1000:1000 ./data;
