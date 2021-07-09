#!/bin/bash
echo "Starting correcting parameters in ../octopus-server/octopusserver.toml.yml...please wait"

sed -i 's/chat_server_address: localhost/chat_server_address: octopus-chat/g' ./octopus-server/octopusserver.toml.yml
sed -i 's/chat_grpc_port: localhost/chat_grpc_port: :8080/g' ./octopus-server/octopusserver.toml.yml
sed -i 's/ads_server_address: localhost/ads_server_address: ads-server/g' ./octopus-server/octopusserver.toml.yml
sed -i 's/comment_server_address: localhost/comment_server_address: octopus-comments/g' ./octopus-server/octopusserver.toml.yml
sed -i 's/analytics_server_address: localhost/analytics_server_address: octopus-analytics/g' ./octopus-server/octopusserver.toml.yml
sed -i 's/ecommerce_server_address: localhost/ecommerce_server_address: octopus-ecommerce/g' ./octopus-server/octopusserver.toml.yml
sed -i 's/ums_server_address: localhost/ums_server_address: ums-server/g' ./octopus-server/octopusserver.toml.yml
sed -i 's/subscription_server_address: localhost/subscription_server_address: octopus-subscription/g' ./octopus-server/octopusserver.toml.yml
sed -i 's/qs_address:/qs_address: quizz-server/g' ./octopus-server/octopusserver.toml.yml
sed -i 's/qs_grpc_port:/qs_grpc_port: :8198/g' ./octopus-server/octopusserver.toml.yml
sed -i 's/\(host=\)\(localhost\)/\1db/g' ./octopus-server/octopusserver.toml.yml
sed -i "s/log_target:.*$/log_target: 'stdout'/g" ./octopus-server/octopusserver.toml.yml
# sed -i 's/^os_storage_bucket/#&/g' octopussever.toml.yml
# sed -i 's/^os_private_storage_bucket/#&/g' octopussever.toml.yml
sed -i 's/os_storage_type: s3/os_storage_type: minio/g' ./octopus-server/octopusserver.toml.yml
sed -i "s/^storage_minio_endpoint:.*/storage_minio_endpoint: 'http:\/\/minio:9000'/g" ./octopus-server/octopusserver.toml.yml
sed -i 's/os_octopush_ip: localhost/os_octopush_ip: rabbitmq/g' ./octopus-server/octopusserver.toml.yml
sed -i 's/chatmq_server_exchange: chatserver/chatmq_server_exchange: octopus-chat/g' ./octopus-server/octopusserver.toml.yml
sed -i 's/chat_server_grpc_port: :8082/chat_server_grpc_port: :8081/g' ./octopus-server/octopusserver.toml.yml
sed -i 's/qs_grpc_port: :8198/qs_grpc_port: :8199/g' ./octopus-server/octopusserver.toml.yml

echo "All required parameters have been corrected!"
