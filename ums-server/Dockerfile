FROM alpine:latest
RUN apk add --no-cache libc6-compat && \
mkdir -p /ums-server && \
mkdir -p /usr/local/mybatis/ && \
mkdir -p /ums-server/data/dbscripts/migrations/drivers && \
mkdir -p /ums-server/data/dbscripts/migrations/environments/
COPY ./ums-server ./files /ums-server/
WORKDIR /ums-server
RUN mv development.properties /ums-server/data/dbscripts/migrations/environments/ && \
mv postgresql-42.2.5.jar /ums-server/data/dbscripts/migrations/drivers && \
unzip mybatis-migrations-3.3.5-bundle.zip -d /usr/local/mybatis/ && \
rm mybatis-migrations-3.3.5-bundle.zip
EXPOSE 8095
EXPOSE 8096
ENTRYPOINT ["./docker-entrypoint.sh"]