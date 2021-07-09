FROM alpine:latest
RUN apk add --no-cache libc6-compat && \
mkdir -p /octopus-server && \
mkdir -p /usr/local/mybatis/ && \
mkdir -p /octopus-server/data/dbscripts/migrations/drivers && \
mkdir -p /octopus-server/data/dbscripts/migrations/environments/
COPY ./octopus-server ./files /octopus-server/
#COPY ./files /octopus-server
WORKDIR /octopus-server
RUN mv development.properties /octopus-server/data/dbscripts/migrations/environments/ && \
mv postgresql-42.2.5.jar /octopus-server/data/dbscripts/migrations/drivers && \
unzip mybatis-migrations-3.3.5-bundle.zip -d /usr/local/mybatis/ && \
rm mybatis-migrations-3.3.5-bundle.zip
EXPOSE 8080
EXPOSE 443
EXPOSE 8081
ENTRYPOINT ["./docker-entrypoint.sh"]
