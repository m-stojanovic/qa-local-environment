#!/bin/bash
echo "Starting correcting parameters in ../signaling-server/signaling-server.toml.yml...please wait"

sed -i 's/octopus_server_address: localhost/octopus_server_address: octopus-server/g' ./signaling-server/signaling-server.toml.yml
sed -i 's/ss_http_port: localhost/ss_http_port: signaling-server/g' ./signaling-server/signaling-server.toml.yml
sed -i 's/signaling_server:signaling_server@localhost/postgres:DrPepper00@db/g' ./signaling-server/signaling-server.toml.yml

echo "All required parameters have been corrected!"