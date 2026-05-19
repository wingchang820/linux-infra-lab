# Network Design

## Purpose

This lab uses a separated network design for infrastructure management and external connectivity validation.

此 Lab 使用分離式網路設計，用於基礎架構管理與對外連線驗證。

---

## VMware Network Layout

| VMnet | Type | Subnet |
|---|---|---|
| VMnet8 | NAT | 192.168.126.0/24 |
| VMnet1 | Host-only | 192.168.132.0/24 |

---

## Infrastructure Layout

| Hostname | Role | NAT IP | Host-only IP |
|---|---|---|---|
| server1 | Linux Server | 192.168.126.128 | 192.168.132.10 |
| server2 | Admin / Test Node | 192.168.126.129 | 192.168.132.20 |

---

## Management Network

The host-only network is used for:

- SSH management
- Internal communication
- Static IP management
- Service validation

This design separates management traffic from external internet access.

---

## SSH Architecture

SSH access is configured through the host-only management network.

Features:

- SSH key authentication
- ED25519 key pair
- Hostname-based SSH access
- Internal hostname resolution

Example:

```bash
ssh server1
ssh server2
```

---

## Validation

Basic connectivity validation:

```bash
ping server1
ping server2
```

SSH validation:

```bash
ssh server1
ssh server2
```

---

## Operations Notes

- NAT is used for external connectivity
- Host-only network is used for infrastructure management
- Static IP addresses simplify SSH operations
- Internal hostname resolution improves operational workflow