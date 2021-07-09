#!/bin/sh
set -e
#cmd="$1"
until nc -z db 5432; do
  echo >&2 "Postgres is unavailable - sleeping"
  sleep 1
done
echo >&2 "Postgres is up - executing command"
if [ -d "./data/dbscripts/migrations" ]; then
  if [ $CONFIG_NAME == "chatserver" ];then
    sed -i "s/placeholder/$DB_NAME/g" data/dbscripts/migrations/environments/development.properties
    apk add --no-cache --virtual builddeps python3 py3-pip openjdk11-jre-headless &&
    pip3 install jinja2-cli pyyaml &&
    jinja2 --strict chatserver.toml.yml > chatserver.toml-trans.yml &&
    jinja2 --strict $CONFIG_NAME.toml.j2 $CONFIG_NAME.toml-trans.yml >$CONFIG_NAME.toml &&
    /usr/local/mybatis/mybatis-migrations-3.3.5/bin/migrate bootstrap --path=data/dbscripts/migrations &&
    /usr/local/mybatis/mybatis-migrations-3.3.5/bin/migrate up --path=data/dbscripts/migrations &&
    apk del builddeps &&
    rm -rf /usr/local/mybatis/ &&
    rm -rf ./data/
  ./$SERVICE
  else
  sed -i "s/placeholder/$DB_NAME/g" data/dbscripts/migrations/environments/development.properties
  apk add --no-cache --virtual builddeps python3 py3-pip openjdk11-jre-headless &&
    pip3 install jinja2-cli pyyaml &&
    jinja2 --strict $CONFIG_NAME.toml.j2 $CONFIG_NAME.toml.yml >$CONFIG_NAME.toml &&
    /usr/local/mybatis/mybatis-migrations-3.3.5/bin/migrate bootstrap --path=data/dbscripts/migrations &&
    /usr/local/mybatis/mybatis-migrations-3.3.5/bin/migrate up --path=data/dbscripts/migrations &&
    apk del builddeps &&
    rm -rf /usr/local/mybatis/ &&
    rm -rf ./data/
  ./$SERVICE
  fi
elif [ ! -f "$CONFIG_NAME.toml" ]; then
  apk add --no-cache --virtual builddeps python3 py3-pip &&
    pip3 install jinja2-cli pyyaml &&
    jinja2 --strict $CONFIG_NAME.toml.j2 $CONFIG_NAME.toml.yml >$CONFIG_NAME.toml &&
    apk del builddeps &&
    rm -rf /usr/local/mybatis/
else
  ./$SERVICE
fi
