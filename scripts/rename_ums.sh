#!/bin/bash
echo "Starting correcting parameters in ../ums-server/ums.toml.yml...please wait"

sed -i 's/analytics_server_address: localhost/analytics_server_address: octopus-analytics/g' ./ums-server/ums.toml.yml
sed -i 's/\(host=\)\(localhost\)/\1db/g' ./ums-server/ums.toml.yml
sed -i "s/log_target:.*$/log_target: 'stdout'/g" ./ums-server/ums.toml.yml
sed -i 's/os_storage_type: s3/os_storage_type: minio/g' ./ums-server/ums.toml.yml
sed -i "s/^storage_minio_endpoint:.*/storage_minio_endpoint: 'http:\/\/minio:9000'/g" ./ums-server/ums.toml.yml
sed -i 's/os_octopush_ip: localhost/os_octopush_ip: rabbitmq/g' ./ums-server/ums.toml.yml

echo "All required parameters have been corrected!"
