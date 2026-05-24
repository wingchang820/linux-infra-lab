# Monitoring Notes

## Purpose

This document records basic Linux system monitoring and operational visibility practices used in the lab environment.

---

## System Monitoring Baseline

Basic system health is checked through:

```bash
uptime
free -h
df -h
top
```

Monitoring scope:

- system uptime
- load average
- memory usage
- disk usage
- process activity

---

## Service Process Check

Nginx process visibility:

```bash
pgrep -a nginx
```

Service state validation:

```bash
systemctl status nginx
```

HTTP response validation:

```bash
curl -I http://server1
```

---

## System Summary Script

A basic system summary script was added for repeatable host-level checks.

```bash
scripts/system-summary.sh
```

The script checks:

- hostname
- uptime and load
- memory usage
- disk usage
- nginx service status
- nginx process visibility

---

## Disk and Log Investigation

Filesystem usage:

```bash
df -h
```

Log directory usage:

```bash
sudo du -sh /var/log/*
```

Nginx log files:

```bash
sudo ls -lh /var/log/nginx
```

Recent nginx access logs:

```bash
sudo tail -n 10 /var/log/nginx/access.log
```

---

## Cross-host Validation

Nginx was validated from server2 to server1:

```bash
curl http://server1
```

The request was recorded in server1 nginx access log with the server2 source IP:

```text
192.168.132.20
```

This confirms that service validation is not limited to localhost testing.

---

## Operations Notes

- System monitoring helps identify host-level resource issues
- Service validation should include both process and HTTP checks
- Disk usage should be monitored to prevent service impact
- Logs are common sources of disk growth
- Access logs can help confirm client activity and source IP
- Cross-host validation provides more realistic infrastructure testing
- Repeatable scripts reduce manual checking effort