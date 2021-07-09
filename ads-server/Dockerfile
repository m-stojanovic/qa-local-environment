FROM alpine:latest
RUN apk add --no-cache libc6-compat && \
mkdir -p /ads-server && \
mkdir -p /usr/local/mybatis/ && \
mkdir -p /ads-server/data/dbscripts/migrations/drivers && \
mkdir -p /ads-server/data/dbscripts/migrations/environments/
COPY ./ads-server ./files  /ads-server/
WORKDIR /ads-server
RUN mv development.properties /ads-server/data/dbscripts/migrations/environments/ && \
mv postgresql-42.2.5.jar /ads-server/data/dbscripts/migrations/drivers && \
unzip mybatis-migrations-3.3.5-bundle.zip -d /usr/local/mybatis/ && \
rm mybatis-migrations-3.3.5-bundle.zip
EXPOSE 8082
EXPOSE 8083
ENTRYPOINT ["./docker-entrypoint.sh"]
