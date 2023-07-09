#!/bin/sh

cp /code/src/main/resources/application.properties_org /code/src/main/resources/application.properties
echo "spring.data.mongodb.username="$MONGO_INITDB_ROOT_USERNAME >> /code/src/main/resources/application.properties
echo "spring.data.mongodb.password="$MONGO_INITDB_ROOT_PASSWORD >> /code/src/main/resources/application.properties