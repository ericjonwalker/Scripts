#!/bin/bash

#####################################
# Purpose:           Set time out on console
# Created by:        Eric Walker
# Created on:        15 July 2009
# Location:          /etc/profile.d/TMOUT.sh
# chmod:	           644
#####################################
 
TMOUT=600		#600 seconds = 10 Minutes
readonly TMOUT
export TMOUT

## if using tcsh shell use, and name file TMOUT.tcsh
#set -r autologout=10          #make readonly and set for 10 Minutes
