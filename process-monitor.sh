#!/bin/bash

#======================================================#
# This script will monitor CPU usage for Given process #
# Author: Naum Ivanovski                               #
#======================================================#

# Loop control flag
CONTINUE=1;

# Interval in seconds
INTERVAL=1;

LOG_FILE="/tmp/test.log";
PROCESS_NAME="test.sh";

# Initialize script
while [ $CONTINUE -eq 1 ];
do
	# Timestamp
	TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

	# Get CPU utilization by process
	CPU_INFO=$(ps -C "${PROCESS_NAME}" -o %cpu | tail -n +2)

	# Log to logfile
	echo "${TIMESTAMP} | ${CPU_INFO}" >> $LOG_FILE

	# Pause for duration of interval
	sleep $INTERVAL
done
