# Troubleshooting Notes

## Purpose

Operational validation, investigation, recovery, and re-validation workflows used in the lab environment.

---

# SSH Connectivity

## Validation Goal

Verify multi-host SSH communication and hostname-based access between server1 and server2.

## Network Validation

```bash
ping server1
ping server2
```

## Service Validation

```bash
systemctl status sshd
```

## Firewall Validation

```bash
firewall-cmd --list-all
```

## Hostname Validation

```bash
cat /etc/hosts
```

## SSH Validation

```bash
ssh server1
ssh server2
```

## Recovery Action

```bash
sudo systemctl restart sshd
```

## Observation

- SSH connectivity restored successfully
- hostname-based SSH access operational
- static IP communication verified

---

# Nginx Service Validation

## Validation Goal

Verify nginx service state, process visibility, and HTTP response availability.

## Service Validation

```bash
systemctl status nginx
```

## Log Investigation

```bash
journalctl -u nginx --no-pager -n 20
```

## Process Validation

```bash
pgrep -a nginx
```

## HTTP Validation

```bash
curl -I http://server1
```

## Recovery Actions

Start nginx service:

```bash
sudo systemctl start nginx
```

Restart nginx service:

```bash
sudo systemctl restart nginx
```

Reload nginx configuration:

```bash
sudo systemctl reload nginx
```

## Observation

Restart:

- nginx PID changed
- process recreated

Reload:

- nginx PID unchanged
- configuration reloaded without full restart

Boot persistence validation:

```bash
systemctl is-enabled nginx
```

Expected result:

```text
enabled
```

## Operations Notes

- restart recreates service processes
- reload re-reads configuration without full restart
- running service does not guarantee reboot persistence
- recovery should always be followed by re-validation

---

# Cron & Automation Validation

## Validation Goal

Verify scheduled nginx health-check automation.

## Scheduler Validation

```bash
crontab -l
```

## Time Validation

```bash
date
```

## Log Validation

```bash
tail -n 20 ~/logs/nginx-health.log
```

## Observation

- cron jobs executed in background
- health-check logs updated automatically
- scheduled validation functioning correctly

---

# Log Rotation Validation

## Validation Goal

Prevent uncontrolled health-check log growth.

## Rotation Validation

```bash
sudo logrotate -f /etc/logrotate.d/nginx-health
```

## Archive Validation

```bash
ls -lh ~/logs
```

## Observation

- rotated logs compressed successfully
- active log recreated automatically

---

# Monitoring & Visibility

## Validation Goal

Establish baseline host visibility, process monitoring, and log investigation workflows.

## System Monitoring

```bash
uptime

free -h

df -h

top
```

## Process Validation

```bash
ps aux | grep nginx

pgrep -a nginx
```

## Disk Investigation

```bash
sudo du -sh /var/log/*
```

## Log Investigation

```bash
sudo ls -lh /var/log/nginx

sudo tail -n 10 /var/log/nginx/access.log
```

## Cross-host Validation

Generate HTTP request from server2:

```bash
curl http://server1
```

Observed source IP:

```text
192.168.132.20
```

## Observation

- nginx access.log recorded client requests
- cross-host HTTP validation successful
- logs identified as disk growth source
- process visibility confirmed through nginx workers

---

# Failed Service Investigation

## Validation Goal

Investigate failed systemd units and validate related logs.

## Failed Unit Validation

```bash
systemctl --failed
```

## Unit Investigation

```bash
systemctl status run-vmblock\\x2dfuse.mount
```

## Log Investigation

```bash
journalctl -u run-vmblock\\x2dfuse.mount --no-pager -n 20
```

## Observation

Observed failed state:

```text
Active: failed
Result: exit-code
```

Observed mount failure:

```text
wrong fs type
bad option
bad superblock
```

## Operations Notes

- failed units should be investigated through:
  - status validation
  - log investigation
- journalctl is important for systemd-level troubleshooting