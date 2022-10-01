#!/bin/bash

echo "start the project with local env"

echo "starting local azuresqledge cluster ..."
docker-compose -f docker-compose.azuresqledge.yml up -d

echo "waiting for 10 secs that local azuresqledge cluster completes initialization..."
sleep 10

echo "starting dbt job ..."
docker-compose -f docker-compose.yml up --build -d

echo "viewing earnings container logs... press CTRL+c to exit"
docker-compose -f docker-compose.yml logs -f