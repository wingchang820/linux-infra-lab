# Network Design

## Topology

- NAT network for internet access and package updates
- Host-only network for internal SSH management

---

## VMware Network Layout

| VMnet | Type | Subnet |
|-------|------|---------|
| VMnet8 | NAT | 192.168.126.0/24 |
| VMnet1 | Host-only | 192.168.132.0/24 |

---

## Infrastructure Layout

| Hostname | Role | NAT IP | Host-only IP |
|----------|------|---------|---------------|
| server1 | Admin / Web Server | 192.168.126.128 | 192.168.132.10 |
| server2 | Client / Test Node | 192.168.126.129 | 192.168.132.20 |

---

## SSH Management

- SSH key authentication configured
- Hostname-based SSH management enabled
- Internal management traffic uses Host-only network
- Bidirectional SSH validation completed

---

## Validation

- server2 → server1 SSH success
- server1 → server2 SSH success
- Static IP persistence verified after reboot
- Hostname resolution verified using `/etc/hosts`