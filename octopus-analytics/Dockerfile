FROM alpine:latest
RUN apk add --no-cache libc6-compat && \
mkdir -p /analytics-server && \
mkdir -p /usr/local/mybatis/ && \
mkdir -p /analytics-server/data/dbscripts/migrations/drivers && \
mkdir -p /analytics-server/data/dbscripts/migrations/environments/
COPY ./octopus-analytics ./files /analytics-server/
WORKDIR /analytics-server
RUN mv development.properties /analytics-server/data/dbscripts/migrations/environments/ && \
mv postgresql-42.2.5.jar /analytics-server/data/dbscripts/migrations/drivers && \
unzip mybatis-migrations-3.3.5-bundle.zip -d /usr/local/mybatis/ && \
rm mybatis-migrations-3.3.5-bundle.zip
EXPOSE 8085
EXPOSE 8086
ENTRYPOINT ["./docker-entrypoint.sh"]
