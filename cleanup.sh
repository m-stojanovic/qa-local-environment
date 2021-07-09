#!/bin/bash

docker-compose down -v --rmi local
git reset --hard origin/main
git clean -d --force