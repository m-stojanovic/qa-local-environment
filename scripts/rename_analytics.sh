#!/bin/bash
echo "Starting correcting parameters in ../octopus-analytics/octopusanalyticsserver.toml.yml...please wait"

sed -i 's/ec_ip_address: localhost/ec_ip_address: octopus-ecommerce/g' ./octopus-analytics/octopusanalyticsserver.toml.yml
sed -i 's/os_ip_address: localhost/os_ip_address: octopus-server/g' ./octopus-analytics/octopusanalyticsserver.toml.yml
sed -i 's/\(host=\)\(localhost\)/\1db/g' ./octopus-analytics/octopusanalyticsserver.toml.yml
sed -i "s/log_target:.*$/log_target: 'stdout'/g" ./octopus-analytics/octopusanalyticsserver.toml.yml

echo "All required parameters have been corrected!"
