#!/bin/bash

echo "stopping the project with local docker env"
docker-compose -f docker-compose.yml -f docker-compose.sqlserver.yml -f docker-compose.azuresqledge.yml down
