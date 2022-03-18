#!/bin/bash

#======================================================================#
# This script will monitor CPU, and RAM usage and write things in file #
# Author: Naum Ivanovski                                               #
#======================================================================#

#============#
# Parameters #
#============#

# Interval how often to get metrics
INTERVAL=1;

# File to log metrics
LOG_FILE="/tmp/statistics.log"

# Loop Control flag
CONTINUE=1;

#==================#
# Initiate program #
#==================#

while [ $CONTINUE -eq 1 ];
do
	# Get timestamp
	TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

	# Get CPU utilization in % (Formula: 100 - idle CPU)
	CPU_INFO=$(top -b -n 1 | grep "Cpu" | awk '{print "CPU Usage: "100-$8"%"}')

	# Get RAM memory utilization (Formula: used/total MB (used/total*100%))
	RAM_INFO=$(free -m | grep "Mem:" | awk '{printf "RAM Usage: %s/%s MB (%.1f%)",$3,$2,$3/$2*100}')

	# Get SWAP memory utilization (Formula: used/total MB (used/total*100%))
	SWAP_INFO=$(free -m | grep "Swap:" | awk '{printf "Swap Usage: %s/%s MB (%.1f%)", $3, $2, $3/$2*100}')

	# Write to file
	echo "${TIMESTAMP} | ${CPU_INFO} | ${RAM_INFO} | ${SWAP_INFO}" >> $LOG_FILE

	# Pause for Interval seconds
	sleep $INTERVAL
done
