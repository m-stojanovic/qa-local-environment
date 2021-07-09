#!/bin/bash
echo "Starting correcting parameters in ../octopus-octopush/octopush.toml.yml...please wait"

sed -i 's/octopush_rabbitmq_ip: 127.0.0.1/octopush_rabbitmq_ip: rabbitmq/g' ./octopus-octopush/octopush.toml.yml
sed -i "s/octopush_apn_enable: 'true'/octopush_apn_enable: 'false'/g" ./octopus-octopush/octopush.toml.yml
sed -i "s/octopush_fcm_enable: 'true'/octopush_fcm_enable: 'false'/g" ./octopus-octopush/octopush.toml.yml

echo "All required parameters have been corrected!"