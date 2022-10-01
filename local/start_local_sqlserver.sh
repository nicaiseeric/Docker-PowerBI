#!/bin/bash

echo "start the project with local env"

echo "starting local sqlserver cluster ..."
docker-compose -f docker-compose.sqlserver.yml up -d

echo "waiting for 20 secs that local sqlserver cluster completes initialization..."
sleep 20

echo "starting dbt job ..."
docker-compose -f docker-compose.yml up --build -d

echo "viewing earnings container logs... press CTRL+c to exit"
docker-compose -f docker-compose.yml logs -f