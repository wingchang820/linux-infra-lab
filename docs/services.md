# Service Operations

## Nginx Web Service

Nginx was deployed on server1 for Linux service validation and internal connectivity testing.

---

## Service Deployment

```bash
dnf install -y nginx
systemctl enable --now nginx
```

---

## Service Validation

```bash
systemctl status nginx
curl -I http://server1
```

---

## Firewall Integration

```bash
firewall-cmd --add-service=http --permanent
firewall-cmd --reload
```

---

## Configuration Management

```bash
nginx -t
systemctl reload nginx
```

---

## Health Check Automation

Basic health check automation was implemented with a custom bash script.

```bash
scripts/check-nginx.sh
```

The script validates:

- nginx service status
- HTTP response
- log output
- exit code handling

Scheduled validation can be configured with cron.

---

## Operations Notes

- server1 hosts nginx service
- server2 is used for validation
- firewalld manages HTTP access
- configuration should be validated before reload
- reload is preferred over restart when possible