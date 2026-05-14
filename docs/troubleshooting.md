# Troubleshooting Notes

## Nginx Service Validation

### Scenario

(Day9) Nginx service became unavailable during validation testing.

---

### Investigation Flow

Check service status:

```bash
systemctl status nginx
```

Review service logs:

```bash
journalctl -u nginx --no-pager -n 20
```

Validate connectivity from another host:

```bash
curl -I http://server1
```

---

### Recovery

Restart nginx service:

```bash
systemctl start nginx
```

---

### Validation Result

```text
HTTP/1.1 200 OK
Server: nginx
```

---

### Operations Notes

- Validate services from another host whenever possible
- Check service status before modifying configurations
- Use journalctl for service log analysis
- Follow a consistent troubleshooting workflow:
  validation → investigation → recovery → re-validation