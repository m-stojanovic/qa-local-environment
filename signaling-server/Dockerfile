FROM alpine:latest
RUN apk add --no-cache libc6-compat && \
mkdir -p /signaling-server
COPY ./signaling-server ./files /signaling-server/
WORKDIR /signaling-server
EXPOSE 8080
ENTRYPOINT ["./docker-entrypoint.sh"]