# PRTG Zpool / ZFS Monitoring
PRTG Script to monitor Proxmox VE datastores capacity usage 


![PRTG Probes](https://i.ibb.co/3sqr4Zk/Screenshot-2020-12-09-191957.png)

# USE:
# On the device side:
Put script in /var/prtg/scriptsxml/ - if folder does not exist, create it
chmod +x the script to make it executable

# On the Server side:
Add advanced ssh script sensor on the target host
Name sensor and select the script - adjust Scan interval in case of need
Add sensor
Edit channel limits as needed
