#!/bin/bash
echo "Starting correcting parameters in ./octopusAdsServer.toml.yml...please wait"

sed -i 's/os_ip_address: localhost/os_ip_address: octopus-server/g' ./ads-server/octopusAdsServer.toml.yml
sed -i 's/\(host=\)\(localhost\)/\1db/g' ./ads-server/octopusAdsServer.toml.yml
sed -i "s/log_target:.*$/log_target: 'stdout'/g" ./ads-server/octopusAdsServer.toml.yml

echo "All required parameters have been corrected!"
