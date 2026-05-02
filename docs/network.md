# Network Notes

## Planned Network Design

This lab will use two network adapters:

| Adapter   | Purpose                                  |
|-----------|------------------------------------------|
| NAT       | Internet access for package installation |
| Host-only | Internal communication between VMs and host machine |

## Planned Hosts

| Hostname |        Role        | Planned IP |
|----------|--------------------|------------|
| server1  | Admin / Web Server | TBD        |
| server2  | Client / Test Node | TBD        |

## Ports

| Port | Service |
|------|---------|
| 22   | SSH     |
| 80   | HTTP    |

## Validation Plan

The network will be validated using:

```bash
ip a
ping
ssh
curl