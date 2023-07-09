FROM maven:3.8.3-openjdk-17 AS build

ARG MONGO_INITDB_ROOT_USERNAME
ARG MONGO_INITDB_ROOT_PASSWORD

ENV MONGO_DB_USERNAME=$MONGO_INITDB_ROOT_USERNAME
ENV MONGO_DB_PASS=${MONGO_DB_USERNAME}
ENV MONGO_URL="mongodb://$MONGO_USERNAME:$MONGO_PASSWORD@mongodb:27017/"

RUN mkdir -p /code
WORKDIR /code
COPY . /code/
RUN cp /code/src/main/resources/application.properties /code/src/main/resources/application.properties_org
RUN cd /code/ && mvn clean install
EXPOSE 80
CMD ["./update_mongo_vars.sh && mvn spring-boot:run" ]