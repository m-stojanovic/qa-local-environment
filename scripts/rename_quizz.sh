#!/bin/bash
echo "Starting correcting parameters in ../quizz-server/quizzserver.toml.yml...please wait"

sed -i 's/ums_server_address: localhost/ums_server_address: ums-server/g' ./quizz-server/quizzserver.toml.yml
sed -i 's/os_server_address: localhost/os_server_address: octopus-server/g' ./quizz-server/quizzserver.toml.yml
sed -i 's/host=localhost/host=db/g' ./quizz-server/quizzserver.toml.yml
sed -i 's/qs_storage_access_key:/qs_storage_access_key: minio/g' ./quizz-server/quizzserver.toml.yml
sed -i 's/qs_storage_secret_key:/qs_storage_secret_key: minio123/g' ./quizz-server/quizzserver.toml.yml
sed -i 's/127.0.0.1:9001/http:\/\/minio:9000/g' ./quizz-server/quizzserver.toml.yml

echo "All required parameters have been corrected!"