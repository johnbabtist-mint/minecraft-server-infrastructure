#!/usr/bin/env bash

###############################################################
# Minecraft Logs Viewer (Public Template)
# Author: JohnnyB
# This script demonstrates how to view server logs safely
# without revealing any private information.
###############################################################

SERVICE_NAME="minecraft"
MINECRAFT_LOG="./logs/latest.log"   # Public template path

echo "=== Minecraft Logs Viewer (Example) ==="
echo

echo "[1] Systemd service log:"
echo "---------------------------------------"
if systemctl list-units | grep -q "${SERVICE_NAME}.service"; then
    journalctl -u ${SERVICE_NAME} -n 50 --no-pager
else
    echo "[INFO] Service '${SERVICE_NAME}.service' not found (example)."
fi

echo
echo "[2] Minecraft latest.log:"
echo "---------------------------------------"
if [ -f "$MINECRAFT_LOG" ]; then
    tail -n 50 "$MINECRAFT_LOG"
else
    echo "[INFO] No Minecraft log found at $MINECRAFT_LOG (example)."
fi

echo
echo "[NOTE] This script is a public-safe example and contains no real paths."
