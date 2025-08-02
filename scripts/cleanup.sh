#!/bin/bash

docker stop joomla-app joomla-mysql
docker rm joomla-app joomla-mysql
rm -rf ../volumes/mysql_data/*
rm -rf ../volumes/joomla_data/*
echo "Containers removed and volume data cleared"
