# Installation Notes

## Purpose

Build a two-node Rocky Linux lab environment for practicing Linux infrastructure operations, networking, security, and service management.

建立雙節點 Rocky Linux Lab，用於練習 Linux Infrastructure Operations、網路、安全設定與服務管理。

---

## Environment Overview

| Hostname | Role |
|---|---|
| server1 | Linux Server / Management Target |
| server2 | Admin / Test Node |

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
  (Internal management network)

---

## Infrastructure Components

Current lab components:

- Rocky Linux 10.1 virtual machines
- Multi-host environment
- NAT and host-only network design
- Static IP management network
- SSH key authentication
- Hostname-based SSH management
- firewalld security baseline

---

## Operations Goals

This lab is designed to simulate a small Linux infrastructure environment focused on:

- Linux server management
- Infrastructure operations
- Service validation
- Security baseline configuration
- Troubleshooting workflows
- Basic automation practices