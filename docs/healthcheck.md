# Container Health Check Monitoring

## Goal

Validate container health monitoring using Docker Compose healthcheck.

---

## Environment

| Component       | Value             |
| --------------- | ----------------- |
| Runtime         | Docker Compose    |
| Proxy Service   | Nginx             |
| Backend Service | Nginx             |
| Validation Host | server1 / server2 |

---

## Health Check Configuration

```yaml
healthcheck:
  test: ["CMD", "curl", "-f", "http://localhost"]
  interval: 10s
  timeout: 3s
  retries: 3
```

Purpose:

* Verify HTTP service availability
* Distinguish running containers from healthy services
* Enable automated health monitoring

---

## Deployment

```bash
docker compose up -d
```

Validate status:

```bash
docker compose ps
```

---

## Healthy State Validation

Result:

```text
proxy ... Up (healthy)
```

Validation:

* container running
* HTTP endpoint responding
* health check successful

---

## Unhealthy State Validation

Modified health check target:

```yaml
test: ["CMD", "curl", "-f", "http://localhost/notfound"]
```

Result:

```text
proxy ... Up (unhealthy)
```

Validation:

* container remained running
* service health check failed
* Docker correctly reported unhealthy status

---

## Health Inspection

Inspect container health details:

```bash
docker inspect proxy
```

Observed values:

```text
Status: healthy
FailingStreak: 0
ExitCode: 0
```

Validation:

* health check executed successfully
* response returned from backend service
* health status recorded by Docker

---

## Key Takeaways

* Container status and service health are different concepts
* Running containers may still provide unhealthy services
* Health checks provide application-level monitoring
* Docker can automatically track healthy and unhealthy states
* Health monitoring is a foundation for automated recovery and orchestration