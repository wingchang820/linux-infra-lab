# Installation Notes

## Purpose

Build a two-node Rocky Linux lab environment for practicing Linux administration, networking, security, and service deployment.

建立雙節點 Rocky Linux Lab，用於練習 Linux 系統管理、網路、安全設定與服務部署。

---

## Environment Overview

| Hostname | Role |
|---|---|
| server1 | Admin / Web Server |
| server2 | Client / Test Node |

Operating System:

Rocky Linux 10.1 x86_64

Hypervisor:

VMware Workstation Pro

---

## VM Specifications

Recommended settings for each VM:

- CPU: 2 cores
- Memory: 4 GB
- Disk: 40 GB

---

## Network Design

- Adapter 1: NAT  
  (Internet access)

- Adapter 2: Host-only  
  (Internal communication between VMs)

---

## Build Progress

- [ ] Create server1
- [ ] Install Rocky Linux on server1
- [ ] Create server2
- [ ] Configure hostname
- [ ] Configure network
- [ ] Validate SSH connectivity