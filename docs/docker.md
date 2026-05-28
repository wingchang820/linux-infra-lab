# Docker Container Operations

## Validation Goal

Validate Docker Engine installation and deploy the first containerized nginx service within the infrastructure lab environment.

---

## Environment

| Component | Value            |
| --------- | ---------------- |
| Host      | server1          |
| OS        | Rocky Linux 10.1 |
| Runtime   | Docker Engine CE |

---

# Docker Engine Installation

## Install Docker Repository

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

# Runtime Validation

## Verify Docker Engine

```bash
docker version
```

## Test Docker Runtime

```bash
docker run hello-world
```

## Validate Downloaded Images

```bash
docker images
```

## Validation Result

* Docker daemon operational
* image download successful
* container runtime functional
* local image cache available

---

# Nginx Container Deployment

## Pull nginx Image

```bash
docker pull nginx
```

## Deploy nginx Container

```bash
docker run -d --name web1 -p 8080:80 nginx
```

---

# Container Validation

## Verify Running Container

```bash
docker ps
```

## HTTP Validation

```bash
curl localhost:8080
```

## Cross-Host Validation

From server2:

```bash
curl 192.168.132.10:8080
```

## Validation Result

* nginx container reachable locally
* cross-host HTTP validation successful
* Docker port mapping operational
* containerized web service accessible from external host

---

# Container Lifecycle Operations

## View Container Logs

```bash
docker logs web1
```

## Stop Container

```bash
docker stop web1
```

## Validate Container State

```bash
docker ps -a
```

## Validation Result

* stopped container state visible
* exited container lifecycle validated

## Start Container

```bash
docker start web1
```

---

# Operations Notes

* Docker images act as reusable templates
* containers are runtime instances created from images
* multiple containers can be created from the same image
* port mapping forwards host traffic into container services
* containerized services can be validated across hosts
* containers are designed to be disposable runtime objects
* Docker enables repeatable service deployment
* containerized services can be recreated consistently across environments