#!/bin/bash
echo "Starting correcting parameters in ../chat-server/chatserver.toml.yml...please wait"

sed  -i "s/{ name: 'dev', endpoint: \"postgres:\/\/octopus_chat:octopus_chat@localhost\/octopus_chat?sslmode=disable\" }/{ name: 'dev', endpoint: \"host=db port=5432 user=postgres password=DrPepper00 dbname=chat sslmode=disable\" }/g" ./chat-server/chatserver.toml.yml
sed -i 's/\(- \"127.0.0.1:7000"\)/ - "redis:6379"/g' ./chat-server/chatserver.toml.yml
sed -i 's/\(- \"127.0.0.1:700[1-2]\"\)//g' ./chat-server/chatserver.toml.yml
sed -i 's/os_ip_address: 172.31.44.143/os_ip_address: octopus-server/g' ./chat-server/chatserver.toml.yml
sed -i 's/chat_server_rabbitmq_ip: localhost/chat_server_rabbitmq_ip: rabbitmq/g' ./chat-server/chatserver.toml.yml
sed -i 's/chat_server_storage_type: s3/chat_server_storage_type: minio/g' ./chat-server/chatserver.toml.yml
sed -i 's/storage_minio_endpoint: ""/storage_minio_endpoint: \"http:\/\/minio:9000"/g' ./chat-server/chatserver.toml.yml
sed -i 's/storage_access_key: InsertRealCredentials/storage_access_key: minio/g' ./chat-server/chatserver.toml.yml
sed -i 's/storage_secret_key: InsertRealCredentials/storage_secret_key: minio123/g' ./chat-server/chatserver.toml.yml
sed -i 's/os_octopush_ip: localhost/os_octopush_ip: rabbitmq/g' ./chat-server/chatserver.toml.yml

echo "All required parameters have been corrected!"