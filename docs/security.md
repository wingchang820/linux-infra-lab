# Security Baseline

## Purpose

This document records the baseline security configuration used within the lab environment.

此文件記錄 Lab 環境中的基礎安全設定。

---

## SSH Security

SSH management is configured through the host-only management network.

Implemented controls:

- SSH key authentication
- ED25519 key pair
- Passwordless SSH access
- Hostname-based SSH management

Example:

```bash
ssh server1
ssh server2
```

---

## Hostname Resolution

Internal hostname resolution is configured through:

```bash
/etc/hosts
```

This improves SSH operational workflow inside the management network.

---

## Firewall Configuration

firewalld is used as the baseline firewall solution.

Example validation:

```bash
firewall-cmd --list-all
```

Configured services:

```text
ssh
http
```

---

## Management Network Security

The host-only network is used for:

- internal SSH management
- infrastructure communication
- service validation

This separates management traffic from external internet access.

---

## Service Access Control

HTTP access is controlled through firewalld.

Example:

```bash
firewall-cmd --add-service=http --permanent
firewall-cmd --reload
```

---

## Operations Notes

- SSH management uses the host-only network
- Key-based authentication reduces password exposure
- firewalld manages service access control
- Internal hostname resolution improves operational efficiency
- Management traffic is separated from external connectivity