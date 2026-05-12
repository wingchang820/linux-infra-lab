# Firewall Baseline

## Purpose

This lab demonstrates basic Linux firewall management using firewalld on Rocky Linux.

The goal is to validate controlled SSH access through the internal management network.

---

## Firewall Validation

Validation commands:

```bash
firewall-cmd --get-active-zones
firewall-cmd --list-all
firewall-cmd --query-service=ssh
```

Expected result:

```text
yes
```

---

## SSH Validation

SSH access from server2 to server1 was validated through the host-only management network.

```bash
ssh server1
```

---

## Operations Notes

- firewalld is enabled on server1
- SSH is allowed through the firewall
- Host-only network is used as the management network
- Management access is separated from internet access