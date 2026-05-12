# Service Operations

## Purpose

This document records Linux service deployment, validation, and operational management within the lab environment.

---

# Nginx Web Service

## Overview

Nginx was deployed on server1 as the initial web service for validating Linux service management and internal network connectivity.

---

## Environment

| Host | Role | Management IP |
|---|---|---|
| server1 | Web Service Host | 192.168.132.10 |
| server2 | Admin / Test Node | 192.168.132.20 |

---

## Service Installation

Package installation:

```bash
dnf install -y nginx
```

Service enable and startup:

```bash
systemctl enable --now nginx
```

---

## Service Validation

Check service status:

```bash
systemctl status nginx
```

Expected result:

```text
active (running)
```

---

## Firewall Integration

HTTP service was allowed through firewalld.

Validation command:

```bash
firewall-cmd --list-all
```

Expected result:

```text
services: ssh http
```

---

## Connectivity Validation

Validate service access from server2:

```bash
curl -I http://server1
```

Expected result:

```text
HTTP/1.1 200 OK
Server: nginx
```

---

## Operations Notes

- nginx is hosted on server1
- server2 is used as the validation node
- Host-only network is used for internal service validation
- firewalld controls HTTP access
- systemctl is used for service lifecycle management