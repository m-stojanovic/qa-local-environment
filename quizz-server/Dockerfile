FROM alpine:latest
RUN apk add --no-cache libc6-compat && \
mkdir -p /quizz-server && \
mkdir -p /usr/local/mybatis/ && \
mkdir -p /quizz-server/data/dbscripts/migrations/drivers && \
mkdir -p /quizz-server/data/dbscripts/migrations/environments/
COPY ./quizz-server ./files /quizz-server/
WORKDIR /quizz-server
RUN mv development.properties /quizz-server/data/dbscripts/migrations/environments/ && \
mv postgresql-42.2.5.jar /quizz-server/data/dbscripts/migrations/drivers && \
unzip mybatis-migrations-3.3.5-bundle.zip -d /usr/local/mybatis/ && \
rm mybatis-migrations-3.3.5-bundle.zip
EXPOSE 8198
EXPOSE 8199
ENTRYPOINT ["./docker-entrypoint.sh"]