#!/usr/bin/env bash

#################################################################
# Minecraft Server Health Check (Public Template)
# Author: JohnnyB
#
# Ten skrypt prezentuje przykładowe monitorowanie stanu serwera
# w sposób bezpieczny i nadający się do repozytorium publicznego.
#################################################################

SERVICE_NAME="minecraft"

echo "=============================================="
echo "     Minecraft Server Health Check (Example)"
echo "=============================================="
echo

# 1. Status usługi Minecraft
echo "[1] SERVICE STATUS"
echo "----------------------------------------------"
if systemctl list-units | grep -q "${SERVICE_NAME}.service"; then
    systemctl is-active ${SERVICE_NAME}.service
else
    echo "[INFO] Service '${SERVICE_NAME}.service' not found (example)."
fi
echo


# 2. CPU i RAM
echo "[2] SYSTEM LOAD"
echo "----------------------------------------------"
echo "CPU LOAD:"
uptime

echo
echo "RAM USAGE:"
free -h
echo


# 3. Proces Java (Minecraft)
echo "[3] JAVA PROCESS CHECK"
echo "----------------------------------------------"
ps aux | grep java | grep -v grep || echo "[INFO] No java process found (example)."
echo


# 4. Otwarte porty
echo "[4] OPEN PORTS (example)"
echo "----------------------------------------------"
ss -tulpn | head -n 10
echo


# 5. Dostępna przestrzeń dyskowa
echo "[5] DISK SPACE"
echo "----------------------------------------------"
df -h /
echo

echo "=============================================="
echo " Health Check Completed (Example Template)"
echo "=============================================="
