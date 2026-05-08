# Network Notes

## Current Network Design

This lab uses two network adapters on each virtual machine.

| Network Type | Purpose                                           |
|--------------|---------------------------------------------------|
| NAT          | Internet access, dnf update, package installation |
| Host-only    | Internal communication and SSH management         |

---

## VMware Network Layout

| VMnet  | Type      | Subnet           |
|--------|-----------|------------------|
| VMnet8 | NAT       | 192.168.126.0/24 |
| VMnet1 | Host-only | 192.168.132.0/24 |

---

## Current Hosts

| Hostname | Role               | NAT IP          | Host-only IP    |
|----------|--------------------|-----------------|-----------------|
| server1  | Admin / Web Server | 192.168.126.128 | 192.168.132.129 |
| server2  | Client / Test Node | 192.168.126.129 | 192.168.132.130 |

---

## Network Interfaces

### server1

| Interface | Purpose   | IP Address      |
|-----------|-----------|-----------------|
| ens160    | NAT       | 192.168.126.128 |
| ens224    | Host-only | 192.168.132.129 |

### server2

| Interface | Purpose   | IP Address      |
|-----------|-----------|-----------------|
| ens160    | NAT       | 192.168.126.129 |
| ens224    | Host-only | 192.168.132.130 |

---

## SSH Validation

SSH connection was tested successfully using Host-only network.

Example:

```bash
ssh wing@192.168.132.129
```

---

## Important Commands

### Show network interfaces

```bash
ip a
```

Purpose:
Show Linux network interfaces and IP addresses.

---

### Show NetworkManager connections

```bash
nmcli connection show
```

Purpose:
Display current network connections managed by NetworkManager.

---

### Enable network interface

```bash
sudo nmcli device connect ens224
```

Purpose:
Activate the second network adapter.

---

### SSH remote login

```bash
ssh wing@192.168.132.129
```

Purpose:
Remote login to another Linux host using Host-only network.

---

## Notes

- NAT network is used for internet access.
- Host-only network is used for internal communication.
- SSH management is performed through Host-only IP addresses.
- This structure simulates a small enterprise infrastructure environment.