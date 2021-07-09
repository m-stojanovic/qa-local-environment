FROM alpine:latest
RUN apk add --no-cache libc6-compat && \
mkdir -p /subscription-server && \
mkdir -p /usr/local/mybatis/ && \
mkdir -p /subscription-server/data/dbscripts/migrations/drivers && \
mkdir -p /subscription-server/data/dbscripts/migrations/environments/
COPY ./octopus-subscription ./files /subscription-server/
WORKDIR /subscription-server
RUN mv development.properties /subscription-server/data/dbscripts/migrations/environments/ && \
mv postgresql-42.2.5.jar /subscription-server/data/dbscripts/migrations/drivers && \
unzip mybatis-migrations-3.3.5-bundle.zip -d /usr/local/mybatis/ && \
rm mybatis-migrations-3.3.5-bundle.zip
EXPOSE 8097
EXPOSE 8098
ENTRYPOINT ["./docker-entrypoint.sh"]
