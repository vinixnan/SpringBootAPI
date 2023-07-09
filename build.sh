#!/bin/sh

MONGO_USERNAME=$1
MONGO_PASSWORD=$2
MONGO_URL="mongodb://$MONGO_USERNAME:$MONGO_PASSWORD@mongodb:27017/"

echo "MONGO_USERNAME: $MONGO_USERNAME" > .env
echo "MONGO_PASSWORD: $MONGO_PASSWORD" >> .env
echo "MONGO_URL: $MONGO_URL" >> .env

docker-compose -f docker-compose.yml  --env-file .env build --build-arg MONGO_DB_USERNAME=$MONGO_USERNAME --build-arg MONGO_DB_PASS=$MONGO_PASSWORD
