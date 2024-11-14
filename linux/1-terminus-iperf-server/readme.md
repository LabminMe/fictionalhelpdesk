#Scenario: 
As the Foundation grows and expands its knowledge base on Terminus, researchers need a reliable server to test network performance across the planet's vast research network. 
Engineers are tasked with setting up an iPerf server to ensure network stability and performance for future expansions.

##Requirements:

- **System Role**: Install a Linux server to act as an **iPerf performance testing server**.
- **Performance & Stability**: The system should be able to handle multiple concurrent iPerf connections, allowing network engineers to benchmark speed and reliability across the Foundation’s data centers.
- **Setup and Configuration**:
    - Install a lightweight Linux distribution with minimal GUI to conserve resources.
    - Configure iPerf to run as a service on boot.
    - Create secure firewall rules to limit access to only designated testing nodes within the research station's network.
- **User and Access Control**: Restricted access for performance engineers only, with sudo privileges for configuring tests and viewing logs. General researchers should have limited access, primarily for reviewing test results without modifying configurations.
