#!/bin/bash

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
docker exec joomla-mysql sh -c 'exec mysqldump -u root -p"$MYSQL_ROOT_PASSWORD" --all-databases' > "../backup/mysql-backup-$TIMESTAMP.sql"
echo "Backup saved to mysql-backup-$TIMESTAMP.sql"
