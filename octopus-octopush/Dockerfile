FROM alpine:latest
RUN apk add --no-cache libc6-compat && \
mkdir -p /octopush-server
COPY ./octopus-octopush ./files /octopush-server/
WORKDIR /octopush-server
EXPOSE 8080
ENTRYPOINT ["./docker-entrypoint.sh"]