#!/bin/bash

SERVICE_NAME="nginx"
URL="http://localhost"
LOG_FILE="$HOME/logs/nginx-health.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

echo "[$TIMESTAMP] Checking service: $SERVICE_NAME" | tee -a "$LOG_FILE"

if systemctl is-active --quiet "$SERVICE_NAME"; then
    echo "[$TIMESTAMP] Service status: running" | tee -a "$LOG_FILE"
else
    echo "[$TIMESTAMP] Service status: not running" | tee -a "$LOG_FILE"
    exit 1
fi

if curl -s --head "$URL" | grep "200 OK" > /dev/null; then
    echo "[$TIMESTAMP] HTTP check: success" | tee -a "$LOG_FILE"
else
    echo "[$TIMESTAMP] HTTP check: failed" | tee -a "$LOG_FILE"
    exit 1
fi

echo "[$TIMESTAMP] Health check completed successfully" | tee -a "$LOG_FILE"
exit 0