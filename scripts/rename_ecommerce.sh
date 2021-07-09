#!/bin/bash
echo "Starting correcting parameters in ../octopus-ecommerce/ecommerce.toml.yml...please wait"

sed -i "s/comment_server_address: 'localhost'/comment_server_address: octopus-comments/g" ./octopus-ecommerce/ecommerce.toml.yml
sed -i "s/analytics_server_address: 'localhost'/analytics_server_address: octopus-analytics/g" ./octopus-ecommerce/ecommerce.toml.yml
sed -i "s/os_ip_address: 'localhost'/os_ip_address: octopus-server/g" ./octopus-ecommerce/ecommerce.toml.yml
sed -i "s/ums_server_address: 'localhost'/ums_server_address: ums-server/g" ./octopus-ecommerce/ecommerce.toml.yml
sed -i "s/\(host=\)\(localhost\)/\1db/g" ./octopus-ecommerce/ecommerce.toml.yml
sed -i "s/log_target:.*$/log_target: "stdout"/g" ./octopus-ecommerce/ecommerce.toml.yml
sed -i "s/ec_storage_type: s3/ec_storage_type: minio/g" ./octopus-ecommerce/ecommerce.toml.yml
sed -i "s/^storage_minio_endpoint:.*/storage_minio_endpoint: 'http:\/\/minio:9000'/g" ./octopus-ecommerce/ecommerce.toml.yml
sed -i "s/ec_octopush_ip: localhost/ec_octopush_ip: rabbitmq/g" ./octopus-ecommerce/ecommerce.toml.yml
sed -i "s/chatmq_server_exchange: chatserver/chatmq_server_exchange: chat-server/g" ./octopus-ecommerce/ecommerce.toml.yml

echo "All required parameters have been corrected!"
