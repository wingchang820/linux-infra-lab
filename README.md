# Linux Infrastructure Lab

Hands-on Linux infrastructure project built for my transition from COBOL / Mainframe systems to Linux / Infrastructure / DevOps engineering.

Linux 實作型基礎架構作品集，用於展示我從 COBOL / Mainframe 轉型至 Linux / Infrastructure / DevOps 的能力。

---

## Background ｜ 背景

Experienced in large enterprise legacy systems, batch operations, reverse engineering, and technical documentation.

具大型企業舊系統、批次作業、逆向分析與技術文件經驗。

---

## Skills Demonstrated ｜ 展示技能

* Linux Administration
* SSH
* User / Group / sudo
* Firewall Management (firewalld)
* Networking Fundamentals
* Service Management
* Nginx
* Docker
* Docker Compose
* Reverse Proxy
* Health Check Monitoring
* Load Balancing
* Troubleshooting

---

## Architecture ｜ 架構

```text
Client
  ↓
Proxy
  ├── Web1
  └── Web2
```

Infrastructure:

* server1 : Admin / Docker Host / Reverse Proxy
* server2 : Client / Validation Node
* Rocky Linux x2
* NAT + Host-only Network

---

## Current Capabilities ｜ 目前能力

### Infrastructure

* Multi-VM Rocky Linux environment
* NAT + Host-only network design
* Static IP management
* Internal hostname resolution
* SSH key authentication

### System Administration

* User and group management
* sudo privilege delegation
* firewalld service control
* Service lifecycle management

### Web Services

* Nginx deployment and validation
* Health check automation
* Scheduled monitoring with cron
* Log maintenance with logrotate
* Basic troubleshooting workflow

### Container Platform

* Docker Engine installation
* Container lifecycle operations
* Docker image management
* Docker Compose deployment
* Multi-container architecture

### Traffic Management

* Nginx Reverse Proxy
* Backend traffic routing
* Load balancing across multiple containers

### Monitoring

* Container health checks
* Healthy / unhealthy state validation
* Docker health inspection
* Service availability monitoring

---

## Repository Structure ｜ 專案結構

```text
linux-infra-lab
├─ compose.yaml
├─ docs
├─ scripts
├─ screenshots
└─ README.md
```

---

## Documents ｜ 文件

Detailed documentation is available in `/docs`.

Current documents:

* install.md
* network.md
* security.md
* services.md
* troubleshooting.md
* docker.md
* compose.md
* reverse-proxy.md
* healthcheck.md
* load-balancing.md

---

## Author

Wing

Transitioning from Mainframe systems to Linux / Infrastructure / DevOps engineering.