#!/bin/bash

# =========================================================#
# This script check for system resources and displays them #
# Author: Naum Ivanovski				   #
# =========================================================#

# Get CPU utilization in % (Formula: 100 - idle CPU)
CPU_INFO=$(top -b -n 1 | grep "Cpu" | awk '{print "CPU Usage: "100-$8"%"}')

# Get RAM memory utilization (Formula: used/total MB (used/total*100%))
RAM_INFO=$(free -m | grep "Mem:" | awk '{print "RAM Usage: "$3"/"$2" MB (" $3/$2*100 "%)"}')

# Display statistics
echo "${CPU_INFO} | ${RAM_INFO}"
echo ""
