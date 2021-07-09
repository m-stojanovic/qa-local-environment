FROM alpine:latest
RUN apk add --no-cache libc6-compat && \
mkdir -p /chat-server && \
mkdir -p /usr/local/mybatis/ && \
mkdir -p /chat-server/data/dbscripts/migrations/drivers && \
mkdir -p /chat-server/data/dbscripts/migrations/environments/
COPY ./chat-server ./files /chat-server/
WORKDIR /chat-server
RUN mv development.properties /chat-server/data/dbscripts/migrations/environments/ && \
mv postgresql-42.2.5.jar /chat-server/data/dbscripts/migrations/drivers && \
unzip mybatis-migrations-3.3.5-bundle.zip -d /usr/local/mybatis/ && \
rm mybatis-migrations-3.3.5-bundle.zip
EXPOSE 8080
EXPOSE 8081
ENTRYPOINT ["./docker-entrypoint.sh"]
