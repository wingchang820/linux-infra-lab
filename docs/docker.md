# Container Platform Operations

## Validation Goal

Deploy, operate, monitor, and validate a containerized web platform using Docker and Docker Compose within the infrastructure lab environment.

---

## Environment

| Component        | Value            |
| ---------------- | ---------------- |
| Host             | server1          |
| OS               | Rocky Linux 10.1 |
| Runtime          | Docker Engine CE |
| Orchestration    | Docker Compose   |
| Reverse Proxy    | nginx            |
| Backend Services | web1, web2       |

---

# Docker Engine Installation

## Add Docker Repository

```bash
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
```

## Install Docker Engine

```bash
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## Enable Docker Service

```bash
sudo systemctl enable --now docker
```

---

# Docker Runtime Validation

## Verify Engine

```bash
docker version
```

## Validate Runtime

```bash
docker run hello-world
```

## Verify Images

```bash
docker images
```

## Validation Result

* Docker daemon operational
* Container runtime functional
* Image download successful
* Local image cache available

---

# Single Container Deployment

## Pull nginx Image

```bash
docker pull nginx
```

## Deploy Container

```bash
docker run -d --name web1 -p 8080:80 nginx
```

## Validate Service

```bash
docker ps
curl localhost:8080
```

## Cross-Host Validation

From server2:

```bash
curl 192.168.132.10:8080
```

## Validation Result

* Container running successfully
* HTTP service reachable
* Port mapping operational
* Cross-host validation successful

---

# Container Lifecycle Operations

## View Logs

```bash
docker logs web1
```

## Stop Container

```bash
docker stop web1
```

## Start Container

```bash
docker start web1
```

## Validate State

```bash
docker ps -a
```

## Validation Result

* Running state verified
* Stopped state verified
* Lifecycle operations validated

---

# Docker Compose Deployment

## Deploy Compose Environment

```bash
docker compose up -d
```

## Verify Services

```bash
docker compose ps
```

## Remove Environment

```bash
docker compose down
```

## Validation Result

* Declarative deployment operational
* Repeatable environment creation validated
* Multi-container management functional

---

# Reverse Proxy Architecture

## Architecture

```text
Client
  ↓
Reverse Proxy
  ↓
 ┌─────┴─────┐
web1       web2
```

## Validation

```bash
curl http://192.168.132.10:8080
```

## Validation Result

* Reverse proxy routing operational
* Backend services reachable
* Traffic successfully forwarded

---

# Container Health Check

## Verify Health Status

```bash
docker compose ps
```

## Inspect Health Information

```bash
docker inspect proxy
```

## Validation Result

* Health monitoring enabled
* Healthy state visible
* Service health separated from container runtime state

---

# Restart Policy Validation

## Configuration

```yaml
restart: unless-stopped
```

## Validation Result

* Automatic recovery policy configured
* Service resilience improved
* Container restart behavior validated

---

# Load Balancing Validation

## Architecture

```text
Client
  ↓
Proxy
  ↓
 ┌─────┴─────┐
web1       web2
```

## Validation

Repeated requests:

```bash
curl http://192.168.132.10:8080
```

## Validation Result

* Requests distributed across backend containers
* Multi-service architecture operational
* Load balancing behavior validated

---

# Container Monitoring & Visibility

## Service Status

```bash
docker compose ps
```

## Container Status

```bash
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
```

## Resource Monitoring

```bash
docker stats --no-stream
```

## Log Monitoring

```bash
docker logs --tail 0 -f proxy
```

## Cross-Host Validation

From server2:

```bash
curl http://192.168.132.10:8080
```

## Validation Result

* Service status observable
* Container health observable
* Resource usage observable
* Proxy access logs observable
* Client traffic visible in logs
* Health check activity visible in logs

---

# Operational Capabilities Demonstrated

* Docker Engine Administration
* Container Lifecycle Management
* Docker Compose Operations
* Reverse Proxy Deployment
* Health Check Monitoring
* Restart Policy Configuration
* Load Balancing Validation
* Container Observability
* Cross-Host Service Validation
* Basic Platform Troubleshooting

---

# Key Operational Concepts

* Images act as reusable deployment templates
* Containers are runtime instances
* Compose provides declarative deployment
* Reverse proxies separate client access from backend services
* Running containers are not necessarily healthy services
* Health checks improve service visibility
* Restart policies improve resilience
* Logs provide operational visibility
* Monitoring enables faster troubleshooting
* Infrastructure validation should include cross-host testing