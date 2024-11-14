# Ender’s Game Universe – Battle School Network Setup

## Scenario:
As part of the Battle School’s preparation and simulation environments, a robust internal network is required to manage the connectivity of different facilities: the command center, simulation rooms, and living quarters. Each facility needs a separate IP range for dynamic assignments to student devices, training simulators, and command systems. Additionally, certain IPs across these ranges are reserved for critical systems that require static assignments for operational consistency and security.

## Requirements:

- **System Role**: Configure a Linux system as a **DHCP and DNS server**.
- **IP Range Management**: Set up DHCP with three different IP ranges, each assigned to a specific facility:
    - **Range 1**: Command Center (e.g., `192.168.10.0/24`)
    - **Range 2**: Simulation Rooms (e.g., `192.168.20.0/24`)
    - **Range 3**: Living Quarters (e.g., `192.168.30.0/24`)
- **Reserved IPs**: Reserve a total of 8 IP addresses across the ranges for essential systems like training simulators, secure command consoles, and network monitoring devices.

## Setup and Configuration:

1. **Install Linux**:
    - Install a stable Linux distribution such as Ubuntu Server or CentOS to provide a reliable and secure base for the DHCP and DNS services.
2. **DHCP Server Setup**:
    - Install and configure **ISC DHCP server** (or `dnsmasq` for a lighter setup).
    - Define three subnets in the DHCP configuration file, each corresponding to the designated IP range for the Command Center, Simulation Rooms, and Living Quarters.
    - For each range, configure `option routers` and `option domain-name-servers` to ensure devices can communicate within their subnet and resolve internal hostnames.
    - Configure 8 **static IP reservations** across these ranges using MAC addresses to ensure essential systems (e.g., command consoles and training simulators) retain consistent IPs. For example:
        
        ```
        host command_console {
            hardware ethernet 00:1A:2B:3C:4D:5E;
            fixed-address 192.168.10.10;
        }
        
        ```
        | Device |	MAC Address	| Desired IP	| Description |
      | ----------- | ----------- | ----------- | ----------- |
      | Command Console	| 00:1A:2B:3C:4D:5E	| 192.168.10.10	| Main command interface for Battle School’s control center. |
      | Network Monitor	| 00:1B:3C:4D:5E:6F	| 192.168.10.11	| Monitors network traffic and diagnostics for the Command Center. |
      | Sim Room #1	| 00:1C:4D:5E:6F:7A	| 192.168.20.10	| Primary training simulator in Simulation Room #1. |
      | Sim Room #2	| 00:2A:5E:6F:7A:8B	| 192.168.20.11	| Secondary training simulator in Simulation Room #2. |
      | Admin Terminal	| 00:3B:6F:7A:8B:9C	| 192.168.20.12	| Used by instructors for running and monitoring simulations. |
      | Secure Console	| 00:4C:7A:8B:9C:AD	| 192.168.30.10	| Secure access console located in the living quarters for after-hours system access. |
      | Student Terminal #1	| 00:5D:8B:9C:AD:BE	| 192.168.30.11	| Reserved terminal for senior student use in the living quarters. |
      | Student Terminal #2	| 00:6E:9C:AD:BE:CF	| 192.168.30.12	| Reserved terminal for junior student use in the living quarters. |

        
3. **DNS Server Setup**:
    - Install **BIND** or `dnsmasq` to serve as the internal DNS server, providing hostname resolution within the Battle School network.
    - Create an internal DNS zone (e.g., `battleschool.local`) and configure DNS entries for key systems and rooms, such as `commandcenter.battleschool.local` and `simroom1.battleschool.local`.
    - Configure forwarders to allow DNS requests for external addresses to be routed through Battle School’s external network.
4. **Testing and Optimization**:
    - Test each DHCP range to ensure dynamic IP assignments work as expected for the Command Center, Simulation Rooms, and Living Quarters.
    - Verify that reserved IPs correctly map to their respective devices and that DNS resolution functions across the network.
    - Implement logging for DHCP and DNS to monitor address leasing and resolve any connectivity issues promptly.

**User and Access Control**:

- **Access Control**: Limit DHCP and DNS management to specific users or administrators (e.g., network engineers) using `sudo` and group-based permissions to prevent unauthorized configuration changes.
- **Logging and Monitoring**: Set up logging to monitor DHCP leases and DNS queries, essential for maintaining the network’s security and stability, given the sensitive nature of Battle School’s simulations.
