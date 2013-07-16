#!/bin/bash
###############################################################
# Script:  check_time.sh
# Purpose: Check ntp time to see if we are losing time
#          This happens often on virtual systems
# Written By: Eric J. Walker
#
###############################################################
### Options
###############################################################

NTPSERVER='time.ntp.gov'    #NTP server
LIMIT='1.000000'            #Offset in milliseconds

###############################################################
OFFSET=`ntpdate -q $NTPSERVER | egrep -o -m 1 -e "offset ((-)?[0-9]+\.[0-9]+)" | egrep -o -e "[0-9]+\.[0-9]+"`

###############################################################
RESULT=`echo "$OFFSET >= $LIMIT" | bc`

if (("$RESULT" == 1)); then
        echo "Warning: Local clock offset ($OFFSET) larger than limit ($LIMIT)!"
        /sbin/service ntpd stop
        /usr/sbin/ntpdate $NTPSERVER
        /sbin/service ntpd start
fi

exit 0


