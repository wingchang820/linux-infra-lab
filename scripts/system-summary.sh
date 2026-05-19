#!/bin/bash

echo "===== System Summary ====="
echo "Hostname: $(hostname)"
echo

echo "===== Uptime and Load ====="
uptime
echo

echo "===== Memory Usage ====="
free -h
echo

echo "===== Disk Usage ====="
df -h /
echo

echo "===== Nginx Service Status ====="
systemctl is-active nginx
echo

echo "===== Nginx Process ====="
pgrep -a nginx