#!/bin/bash

# Create Docker network if it doesn't exist
docker network inspect joomla-net >/dev/null 2>&1 || docker network create joomla-net

# Start MySQL container
docker run -d \
  --name joomla-mysql \
  --network joomla-net \
  -e MYSQL_ROOT_PASSWORD=my-secret-pw \
  -v "$(pwd)/../volumes/mysql_data:/var/lib/mysql" \
  mysql:latest

# Start Joomla container
docker run -d \
  --name joomla-app \
  --network joomla-net \
  -e JOOMLA_DB_HOST=joomla-mysql \
  -e JOOMLA_DB_USER=root \
  -e JOOMLA_DB_PASSWORD=my-secret-pw \
  -v "$(pwd)/../volumes/joomla_data:/var/www/html" \
  -p 8080:80 \
  joomla
