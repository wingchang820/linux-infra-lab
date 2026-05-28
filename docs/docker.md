# Docker Container Operations

## Validation Goal

Validate Docker Engine installation and deploy first containerized nginx service.

---

## Environment

* Host: server1
* OS: Rocky Linux 10.1
* Container Runtime: Docker Engine Community Edition

---

## Docker Installation

### Install Docker Repository

```bash
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
```

### Install Docker Engine

```bash
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

### Enable Docker Service

```bash
sudo systemctl enable --now docker
```

---

## Runtime Validation

### Verify Docker Engine

```bash
docker version
```

### Test Docker Runtime

```bash
docker run hello-world
```

Validation Result:

* Docker daemon operational
* Image pull successful
* Container lifecycle validated

---

## Nginx Container Deployment

### Pull nginx Image

```bash
docker pull nginx
```

### Run nginx Container

```bash
docker run -d --name web1 -p 8080:80 nginx
```

---

## Container Validation

### Verify Running Container

```bash
docker ps
```

### HTTP Validation

```bash
curl localhost:8080
```

### Cross-Host Validation

From server2:

```bash
curl 192.168.132.10:8080
```

Validation Result:

* nginx container reachable from external host
* Docker port mapping operational
* HTTP response successful

---

## Container Lifecycle Operations

### View Logs

```bash
docker logs web1
```

### Stop Container

```bash
docker stop web1
```

### Start Container

```bash
docker start web1
```

### Remove Old Container

```bash
docker rm vigorous_goldwasser
```

---

## Operations Notes

* Docker images act as reusable templates
* Containers are running instances created from images
* Port mapping forwards host traffic into container services
* Containerized services can be validated across hosts
* Docker containers are disposable runtime objects
