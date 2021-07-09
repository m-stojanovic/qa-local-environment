FROM alpine:latest
RUN apk add --no-cache libc6-compat && \
mkdir -p /ecommerce-server && \
mkdir -p /usr/local/mybatis/ && \
mkdir -p /ecommerce-server/data/dbscripts/migrations/drivers && \
mkdir -p /ecommerce-server/data/dbscripts/migrations/environments/
COPY ./octopus-ecommerce ./files  /ecommerce-server/
WORKDIR /ecommerce-server
RUN mv development.properties /ecommerce-server/data/dbscripts/migrations/environments/ && \
mv postgresql-42.2.5.jar /ecommerce-server/data/dbscripts/migrations/drivers && \
unzip mybatis-migrations-3.3.5-bundle.zip -d /usr/local/mybatis/ && \
rm mybatis-migrations-3.3.5-bundle.zip
EXPOSE 8080
EXPOSE 8089
ENTRYPOINT ["./docker-entrypoint.sh"]