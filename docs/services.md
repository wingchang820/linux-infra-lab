# Service Operations

## Nginx Web Service

Nginx was deployed on server1 to validate Linux service management and internal network connectivity.

---

## Service Management

Install nginx:

```bash
dnf install -y nginx
```

Enable and start service:

```bash
systemctl enable --now nginx
```

Check service status:

```bash
systemctl status nginx
```

---

## Firewall Integration

Allow HTTP service through firewalld:

```bash
firewall-cmd --add-service=http --permanent
firewall-cmd --reload
```

---

## Service Validation

Validate connectivity from server2:

```bash
curl -I http://server1
```

---

## Configuration Validation

Validate nginx configuration before reload:

```bash
nginx -t
```

Reload nginx configuration:

```bash
systemctl reload nginx
```

---

## Operations Notes

- server1 hosts nginx service
- server2 is used for validation
- firewalld controls HTTP access
- nginx configuration should be validated before reload
- reload is preferred over restart when possible