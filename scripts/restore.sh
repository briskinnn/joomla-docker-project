#!/bin/bash

# Replace with your preferred .sql backup file
BACKUP_FILE="../backup/mysql-backup.sql"

if [ ! -f "$BACKUP_FILE" ]; then
  echo "Backup file not found: $BACKUP_FILE"
  exit 1
fi

cat "$BACKUP_FILE" | docker exec -i joomla-mysql sh -c "mysql -u root -pmy-secret-pw"
echo "Restore complete"
