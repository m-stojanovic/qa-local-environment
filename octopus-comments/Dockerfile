FROM alpine:latest
RUN apk add --no-cache libc6-compat && \
mkdir -p /comment-server && \
mkdir -p /usr/local/mybatis/ && \
mkdir -p /comment-server/data/dbscripts/migrations/drivers && \
mkdir -p /comment-server/data/dbscripts/migrations/environments/
COPY ./octopus-comments ./files /comment-server/
WORKDIR /comment-server
RUN mv development.properties /comment-server/data/dbscripts/migrations/environments/ && \
mv postgresql-42.2.5.jar /comment-server/data/dbscripts/migrations/drivers && \
unzip mybatis-migrations-3.3.5-bundle.zip -d /usr/local/mybatis/ && \
rm mybatis-migrations-3.3.5-bundle.zip
EXPOSE 8085
EXPOSE 8084
ENTRYPOINT ["./docker-entrypoint.sh"]
