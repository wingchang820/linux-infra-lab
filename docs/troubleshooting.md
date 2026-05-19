# Troubleshooting Notes

## Nginx Service Validation Failure

### Scenario

Nginx service became unavailable during internal service validation.

---

## Investigation Workflow

Check service status:

```bash
systemctl status nginx
```

Review recent service logs:

```bash
journalctl -u nginx --no-pager -n 20
```

Validate connectivity from another host:

```bash
curl -I http://server1
```

---

## Recovery Workflow

Restart nginx service:

```bash
systemctl start nginx
```

Re-check service status:

```bash
systemctl status nginx
```

Re-validate HTTP response:

```bash
curl -I http://server1
```

---

## Validation Result

Expected response:

```text
HTTP/1.1 200 OK
Server: nginx
```

---

## Operations Notes

- Validate services from another host whenever possible
- Check service status before modifying configurations
- Use journalctl for service log analysis
- Re-validate services after recovery actions
- Follow a consistent troubleshooting workflow:
  validation → investigation → recovery → re-validation