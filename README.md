### Start the environment setup

./start-qa-local-env.sh

### Enter service versions following the example

v1.1.1

### If wrong service version is inserted please ABORT the script

CTRL + C

### For further container management

docker container stop {container_name}
docker container rm {container_name}

### Run removed containers

docker-compose up -d 

### Destroy the environment

./cleanup.sh
