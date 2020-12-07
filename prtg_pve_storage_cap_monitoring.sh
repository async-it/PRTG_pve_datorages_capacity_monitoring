#!/bin/bash

# Async IT Sàrl - Switzerland - 2020
# Jonas Sauge

# USE:
# On the device side:
# 	Put script in /var/prtg/scriptsxml/ - if folder does not exist, create it
#	wget https://raw.githubusercontent.com/async-it/PRTG_pve_storages_cap_monitoring/main/prtg_pve_storage_cap_monitoring.sh
# 	chmod +x the script to make it executable
# 	Add advanced ssh script sensor
# 	Name sensor and select the script - adjust Scan interval in case of need
# 	Add sensor


# Version:
# Version 1.0 - Initial release
# Version 1.1 - Fixed floating values

# ------- Limits settings -----------
limitmaxwarning=75
limitmaxerror=85

echo "<prtg>"
for DATASTORES in `pvesm status | tail -n +2  | awk '{print $1}'`; do
# ----------------------- Result for Capacity in % ----------------------------------
        capacity_percent_used=`pvesm status | awk '$1 == "'$DATASTORES'" {print $0}' | awk '{print $7}' | cut -d'%' -f1`
			echo "<result>"
			echo "<value>$capacity_percent_used</value>"
			echo "<float>1</float>"
			echo "<channel>$DATASTORES Used Capacity</channel>"
			echo "<unit>Percent</unit>"
			echo "<LimitMode>1</LimitMode>"
			echo "<LimitMaxWarning>$limitmaxwarning</LimitMaxWarning>"
			echo "<LimitMaxError>$limitmaxerror</LimitMaxError>"
			echo "</result>"

done
echo "</prtg>"
