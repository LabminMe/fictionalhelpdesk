# The Expanse Universe – Tycho Station Engineering Department
## Scenario: 
On Tycho Station, engineers manage a wide array of data for the shipbuilding operations on the Nauvoo and need a Linux system that supports multiple users with specialized permissions. Each engineering division needs access to different parts of the file system for managing schematics, fuel analysis, and diagnostics.

## Requirements:

- **System Role**: A Linux system with a **multi-user, multi-group configuration** that allows each department specific access to different data sets.
-  [ ] **User Management & Access Controls**: Create distinct user groups for “Structural Engineers,” “Propulsion Engineers,” and “Systems Analysts.” Each group needs access to its own files and should be restricted from other groups’ directories.
- **Setup and Configuration**:
    - [ ] Install a reliable, enterprise-level Linux distribution, such as CentOS or Debian, configured for multi-user environments.
    - [ ] Configure directory structures for each department with distinct ownership and permissions using `chown` and `chmod`.
    - [ ] Implement group-based sudo privileges to allow team leads access to certain system management tasks without full root access.
    - [ ] Set up an automated backup system using `rsync` and `cron` to protect against data loss, given the criticality of engineering data.
- **BONUS - Performance Optimization**: 
Optimize the system to handle heavy data loads, as engineers may frequently work with large 3D modeling files for structural and propulsion analysis.
