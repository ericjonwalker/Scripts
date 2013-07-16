#!/bin/bash

#######################################################################
# Purpose:           Scan for new disks
#                    Used when adding new SAN storage to systems
# Created by:        Eric Walker
# Created on:        10 July 2009
#######################################################################

echo “Scanning for new disks”
for i in `ls /sys/class/scis_host/
    do
        echo “- - -” > /sys/class/scsi_host/$i/scan
    done
    
