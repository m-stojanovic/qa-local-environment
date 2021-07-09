#!/bin/bash
echo "Starting correcting parameters in ../octopus-comments/commentserver.toml.yml...please wait"

sed -i 's/os_ip_address: localhost/os_ip_address: octopus-server/g' ./octopus-comments/commentserver.toml.yml
sed -i 's/\(host=\)\(localhost\)/\1db/g' ./octopus-comments/commentserver.toml.yml
sed -i "s/log_target:.*$/log_target: 'stdout'/g" ./octopus-comments/commentserver.toml.yml

echo "All required parameters have been corrected!"
