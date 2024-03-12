#!/bin/bash

cd mongo

docker-compose up -d

sleep 5

docker exec search-mongo-0 /scripts/configuration.sh

sleep 5

cd ..

docker-compose up -d