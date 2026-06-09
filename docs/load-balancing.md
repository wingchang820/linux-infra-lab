# Load Balancing

## Goal

Distribute incoming traffic across multiple backend containers using Nginx reverse proxy.

---

## Architecture

```text
Client
  ↓
Proxy
  ├── web1
  └── web2
```

---

## Backend Services

### web1

```text
Hello from WEB1 container
```

### web2

```text
Hello from WEB2 container
```

---

## Nginx Upstream Configuration

```nginx
upstream backend {
    server web1:80;
    server web2:80;
}

server {
    listen 80;

    location / {
        proxy_pass http://backend;
    }
}
```

---

## Validation

Start services:

```bash
docker compose up -d
```

Check status:

```bash
docker compose ps
```

Expected services:

```text
proxy
web1
web2
```

---

## Traffic Distribution Test

```bash
for i in {1..10}; do curl -s localhost:8080; done
```

Observed results:

```text
Hello from WEB1 container
Hello from WEB2 container
```

Traffic was successfully distributed across multiple backend containers.

---

## Key Takeaways

* Reverse proxy can distribute requests across multiple backends
* Multiple backend services improve scalability
* Nginx upstream enables basic load balancing
* Infrastructure can be expanded without changing client access points