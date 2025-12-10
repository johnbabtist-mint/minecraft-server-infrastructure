#!/usr/bin/env bash

###############################################################
# Minecraft Server - Public Status Script (Safe for GitHub)
# Author: JohnnyB.
# This script demonstrates how to check a server process
# without exposing any IP addresses or private data.
###############################################################

SERVICE_NAME="minecraft"

echo "=== Minecraft Server Status (Example) ==="

# Check if the service exists (systemd example)
if systemctl list-unit-files | grep -q "${SERVICE_NAME}.service"; then
    systemctl status ${SERVICE_NAME}.service --no-pager
else
    echo "[INFO] Service '${SERVICE_NAME}.service' not found (example)."
fi

echo
echo "[NOTE] This is a safe example script for public repositories."
echo "No sensitive information is included."
