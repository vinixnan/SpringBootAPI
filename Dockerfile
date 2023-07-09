FROM maven:3.8.3-openjdk-17 as maven

RUN mkdir -p /app
WORKDIR /app
COPY . /app/
RUN cd /app/ && mvn clean install -DskipTests=true

FROM openjdk:17-buster as runner

ARG MONGO_INITDB_ROOT_USERNAME
ARG MONGO_INITDB_ROOT_PASSWORD

ENV MONGO_DB_USERNAME=$MONGO_INITDB_ROOT_USERNAME
ENV MONGO_DB_PASS=${MONGO_DB_USERNAME}
ENV MONGO_URL="mongodb://$MONGO_USERNAME:$MONGO_PASSWORD@mongodb:27017/"

ARG DEPENDENCY=/app/target

COPY --from=maven ${DEPENDENCY}/lib/ /app/lib
COPY --from=maven ${DEPENDENCY}/UserApi-0.0.1-SNAPSHOT.jar /app/

EXPOSE 80

CMD ["java", "-jar", "/app/UserApi-0.0.1-SNAPSHOT.jar", "-Dspring-boot.run.arguments='--spring.data.mongodb.host=mongo --spring.data.mongodb.username=$MONGO_INITDB_ROOT_USERNAME --spring.data.mongodb.password=$MONGO_INITDB_ROOT_PASSWORD'"]