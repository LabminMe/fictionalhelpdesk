# Labs for Linux Wizardry
## Resources
Files and directories are in the resources directory. There is a single PDF file with the resource contents that can be added to files or changed to meet your neds, or there is a zipped directory that when extracted at the root, has the folder structure and the files referenced in the labs for your environment. 

## Lab 1: The Sorting Hat Deployment & Navigation

* **Requester:** Professor McGonagall (Deputy Headmistress)  
* **Ticket Request:** *"We need a secure directory structure created for the four school houses to store student records. I also need to find where the old documentation for the Sorting Hat script is hidden on this system, as it's been misbehaving."*

### Objectives

* Navigate the filesystem to locate hidden files.
* Change the hidden file so it is visible and move it into the `/home/shared/general/` directory.  
* Use manual and info pages to understand navigation tools.  
* Create and organize the Hogwarts House directories in the `/home/shared/` directory (`Gryffindor`, `Slytherin`, `Ravenclaw`, `Hufflepuff`).

### Commands Covered

`ls`, `man`, `info`, `cd`, `pwd`, `mkdir`, `rmdir`, `clear`

---

## Lab 2: Management of House Points & Potions Logs

* **Requester:** Professor Snape (Potions Master)  
* **Ticket Request:** *"I require a system to log house point deductions and manage my ingredients inventory. I need 3 files for common, restricted, and rare ingredients. The old file is named pointslog, change it to points_ledger. Also, I accidentally created a directory called `Snape_Secret_Stash` that needs to be moved and hidden immediately. Finally, I need a way to track who is editing the house points file to make sure there is no cheating."*

### Objectives

* Move Snape's directory from the root directory to the `/home/snape/` and hide the directory. 
* Create 3 files in the directory for the ingredients for each type of rarity.
* Find and rename the files for house points.
* Add a program to log edits to the house points file for Snape and configure it to track edits to the file or it's properties.
    * 'auditd' If you are using Debian/Ubuntu
    * 'audit' If you are using RHEL/CentOS
* Add one test line to the file and save t
* Examine the command history to audit who has been messing with the points file.

### Commands Covered

`mv`, `echo`, `touch`, `history`, `man`, `nano`, `rmdir` (cleanup), `alias, ausearch, [audit|auditd]`


---

## Lab 3: Tracking the Marauder’s Map Data

* **Requester:** Remus Lupin (Defense Against the Dark Arts)  
* **Ticket Request:** *"We suspect Peter Pettigrew is roaming the corridors. I have a log file from the Marauder's Map tracking everyone's footsteps, but I need to filter out specific names, see who is currently logged into the castle network, and verify the total line count of the data."*

### Objectives

* Use text processing commands to isolate specific wizard names from a dataset `/var/log/marauders_map.log`.  
* Inspect the latest entry, and the last 3 entries.
* Find the unique names of people who have used the Marauder's Map. 
* Report the number of times that Ron Weasley has used the map.

### Commands Covered

`find`, `tail`, `head`, `whoami`, `who`, `cat`, `less`, `wc`, `grep`, `sort`


---

## Lab 4: Forbidden Forest Security Auditing

* **Requester:** Rubeus Hagrid (Keeper of Keys and Grounds)  
* **Ticket Request:** *"Someone's been trying to access the restricted section of the forest files. I don't know my own User ID right now, and I need you to find what command covers 'permissions' since I forgot the exact name of it. Also, can you create a shortcut link from my hut's directory directly to the Care of Magical Creatures curriculum file?"*

### Objectives

* Verify `hagrid` is a user on the system  
* Create a symbolic/soft link from Hagrid's Desktop directory to the curriculm directory
* Create a static/hard link to the Magical Creatures file in Hagrid's Documents
* Identify the current user context and group IDs.  

**File name:** `/db/curriculum/magical_creatures.txt`

### Commands Covered

`open` (or your system's default file opener), `apropos`, `ln`, `id`, `last`, `su`, `sudo`


---

## Lab 5: The Ministry of Magic Environmental Variables & Automation

* **Requester:** Arthur Weasley (Misuse of Muggle Artifacts Office)  
* **Ticket Request:** *"I've found these fascinating Muggle 'environmental variables'\! I need a report of all system and shell variables at Hogwarts and export them to some bloke named JSON. We also need to configure a recurring automated task (a system cron) that clears out the temporary 'Howler' message buffer every midnight so they don't explode."*

### Objectives

* Manipulate and view local and global environment variables.  
* View fundamental kernel and OS information.  
* Schedule a background automation task using the system's cron daemon.
    * Script: `/usr/local/bin/clear_howlers.sh` 

### Commands Covered

`export`, `uname`, `env`, `printenv`, `crontab`


---

## Lab 6: Department of Mysteries Access Control (ACLs)

* **Requester:** Albus Dumbledore (Headmaster)  
* **Ticket Request:** *"Security is paramount. We are onboarding new staff members: `Luna_Lovegood` and `Cedric_Diggory`. We must create a new group called `Prefects`. Furthermore, the `prophecy_records.txt` file must be restricted so only the file owner can read or write to it, and its default creation mask must be tightened."*

### Objectives

* Provision users and groups safely.  
* Modify standard file permissions using absolute or symbolic modes.  
* Set a system user mask (`umask`) to ensure strict default permissions for newly created prophecies.

**File name:** `/mysteries/prophecy_records.txt` (Initial ownership set to root, needs to be transferred)

### Commands Covered

`chown`, `chmod`, `useradd`, `usermod`, `groupadd`, `groupmod`, `passwd`, `umask`


---

## Lab 7: The Chamber of Secrets Storage & Process Audit

* **Requester:** Hermione Granger (S.P.E.W. Organizer)  
* **Ticket Request:** *"The house-elf registry files are growing exponentially and eating up our storage arrays. I need an audit of our available disk space and free memory. Additionally, there's a rogue process running on the system causing high CPU usage—I think Peeves the Poltergeist is running a fork-bomb. Find it, track its uptime, and look at the archive of old restricted files."*

### Objectives

* Analyze system hardware resources (RAM, Storage).  
* Monitor and identify resource-heavy system processes.  
* View historical system uptime and performance metrics.

### Commands Covered

`df`, `free`, `ps`, `top`, `uptime, cron`

### Resource Files & Setup

* Simulate a high-load environment or a sleeping background process named `peeves_prank.sh`.  
* Crontab \-e \# Open the cron jobs  
  * \# peeves\_prank 0 0 \* \* \* /usr/local/bin/peeves\_prank.sh   
    \# runs the .sh script daily at midnight
