#!/bin/bash
echo "Starting correcting parameters in ../octopus-subscription/subscriptionserver.toml.yml...please wait"

sed -i 's/os_ip_address: localhost/os_ip_address: octopus-server/g' ./octopus-subscription/subscriptionserver.toml.yml
sed -i "s/ums_server_address: 'localhost'/ums_server_address: ums-server/g" ./octopus-subscription/subscriptionserver.toml.yml
sed -i 's/\(host=\)\(localhost\)/\1db/g' ./octopus-subscription/subscriptionserver.toml.yml
sed -i "s/log_target:.*$/log_target: 'stdout'/g" ./octopus-subscription/subscriptionserver.toml.yml
sed -i 's/sub_storage_type: s3/sub_storage_type: minio/g' ./octopus-subscription/subscriptionserver.toml.yml
sed -i "s/^storage_minio_endpoint:.*/storage_minio_endpoint: 'http:\/\/minio:9000'/g" ./octopus-subscription/subscriptionserver.toml.yml

echo "All required parameters have been corrected!"
