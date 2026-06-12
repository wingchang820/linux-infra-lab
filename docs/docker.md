# Container Platform Operations

## Overview

This lab demonstrates deployment, operation, monitoring, and recovery of a containerized web platform using Docker and Docker Compose.

## Environment

| Component        | Value            |
| ---------------- | ---------------- |
| Host OS          | Rocky Linux 10.1 |
| Runtime          | Docker Engine CE |
| Orchestration    | Docker Compose   |
| Reverse Proxy    | nginx            |
| Backend Services | web1, web2       |

---

# Architecture

```text
Client
  ↓
Reverse Proxy (nginx)
  ↓
 ┌─────┴─────┐
web1       web2
```

Capabilities demonstrated:

* Container deployment
* Docker Compose operations
* Reverse proxy routing
* Health monitoring
* Restart policy
* Load balancing
* Service observability
* Failure recovery

---

# Docker Runtime Validation

Validate Docker Engine functionality.

```bash
docker version
docker run hello-world
docker images
```

Validated:

* Docker daemon operational
* Container runtime functional
* Image management functional

---

# Container Operations

Deploy and manage containerized services.

```bash
docker run -d --name web1 -p 8080:80 nginx

docker ps
docker logs web1

docker stop web1
docker start web1
```

Validated:

* Container lifecycle management
* Port mapping
* Runtime visibility

---

# Docker Compose Operations

Manage multi-container environments.

```bash
docker compose up -d
docker compose ps
docker compose down
```

Validated:

* Declarative deployment
* Repeatable environment creation
* Multi-service management

---

# Reverse Proxy Validation

Client requests are routed through nginx to backend containers.

Validation:

```bash
curl http://192.168.132.10:8080
```

Validated:

* Reverse proxy routing
* Backend service accessibility
* Cross-host communication

---

# Health Monitoring

Container health status is monitored independently from runtime status.

Validation:

```bash
docker compose ps
docker inspect proxy
```

Validated:

* Health check integration
* Service health visibility

Key concept:

```text
Container Running
≠
Service Healthy
```

---

# Restart Policy

Automatic service recovery configuration.

Configuration:

```yaml
restart: unless-stopped
```

Validated:

* Service resilience
* Automatic restart behavior

---

# Load Balancing

Traffic distribution across multiple backend containers.

Validation:

```bash
for i in {1..5}; do curl http://192.168.132.10:8080; echo; done
```

Example result:

```text
Hello from WEB1 container
Hello from WEB2 container
Hello from WEB1 container
```

Validated:

* Request distribution
* Multi-backend architecture

---

# Observability

Monitor service status, resource usage, and application logs.

Validation:

```bash
docker compose ps

docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

docker stats --no-stream

docker logs --tail 0 -f proxy
```

Validated:

* Service visibility
* Health visibility
* Resource visibility
* Log visibility

---

# Failure Simulation & Recovery

## Backend Failure

Simulated failure:

```bash
docker stop web1
```

Observed:

```text
proxy Up
web2 Up
web1 Exited
```

Proxy log example:

```text
connect() failed
No route to host
```

Service remained available through the remaining backend.

Recovery:

```bash
docker start web1
```

Validated:

* Backend failure detection
* Log-based troubleshooting
* Service continuity
* Recovery validation

---

## Proxy Failure

Simulated failure:

```bash
docker stop proxy
```

Observed:

```text
proxy Exited
web1 Up
web2 Up
```

Client validation:

```bash
curl http://192.168.132.10:8080
```

Result:

```text
Failed to connect
```

Recovery:

```bash
docker start proxy
```

Validated:

* Proxy as single entry point
* Service outage detection
* Recovery validation

Key concept:

```text
Backend Redundancy
≠
Platform Availability
```

---

# Operational Capabilities Demonstrated

* Docker Engine Administration
* Container Lifecycle Management
* Docker Compose Operations
* Reverse Proxy Deployment
* Health Monitoring
* Restart Policy Configuration
* Load Balancing
* Service Observability
* Failure Simulation
* Recovery Validation
* Cross-Host Service Validation
* Basic Troubleshooting