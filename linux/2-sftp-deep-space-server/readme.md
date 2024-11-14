# Star Trek Universe – Deep Space Relay Station
## Scenario: 
In the 24th century, a deep-space relay station needs a secure way to transfer logs, communications, and diagnostic data between Starfleet and the station's automated systems. Linux systems are selected for setting up a secure SFTP server to facilitate file transfers between the station and nearby vessels or headquarters.

## Requirements:

- **System Role**: Configure Linux as both an **SFTP server and client**.
- **Security & Encryption**: The server should prioritize security protocols due to sensitive Starfleet communications, with encrypted transfers only (disable insecure FTP entirely).
- **Setup and Configuration**:
    - Install a Linux distribution known for security features (e.g., Ubuntu Server with OpenSSH).
    - Configure SFTP with key-based authentication and restrict root SSH access.
    - Create automated SFTP connections using cron jobs to periodically push logs to Starfleet Command’s secure servers.
    - Configure logging and alerts to detect unauthorized access attempts, with scripts to notify administrators of potential breaches.
- **User and Access Control**: Create user groups for different Starfleet personnel roles, with limited access to specific directories based on need-to-know. Officers have access to all logs, while maintenance staff have access only to specific system diagnostics folders.
