FROM maven:3.8.3-openjdk-17 AS build

ARG MONGO_DB_USERNAME
ARG MONGO_DB_PASS
RUN mkdir -p /code
WORKDIR /code
COPY . /code/
RUN cp /code/src/main/resources/application.properties /code/src/main/resources/application.properties_org
RUN echo "spring.data.mongodb.username="$MONGO_DB_USERNAME >> /code/src/main/resources/application.properties
RUN echo "spring.data.mongodb.password="$MONGO_DB_PASS >> /code/src/main/resources/application.properties
RUN cd /code/ && mvn clean install
EXPOSE 80
ENTRYPOINT [ "cd /code/ && mvn spring-boot:run" ]