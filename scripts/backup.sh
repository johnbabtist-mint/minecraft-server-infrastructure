#!/usr/bin/env bash

###############################################################
# Minecraft Backup Script (Public Template)
# Author: JohnnyB
# This script demonstrates safe backup automation
# without revealing private server data.
###############################################################

SOURCE_DIR="/opt/minecraft/world"
BACKUP_DIR="./backups"

DATE=$(date +%Y-%m-%d_%H-%M-%S)
FILENAME="mc-backup-$DATE.tar.gz"

mkdir -p "$BACKUP_DIR"

echo "[INFO] Creating backup: $FILENAME"
tar -czf "$BACKUP_DIR/$FILENAME" -C "$SOURCE_DIR" .

if [ $? -eq 0 ]; then
    echo "[OK] Backup completed successfully."
else
    echo "[ERROR] Backup failed."
fi

echo "[INFO] Backup stored in: $BACKUP_DIR"
