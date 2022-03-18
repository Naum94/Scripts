#!/bin/bash

# =========================================================#
# This script check for system resources and displays them #
# Author: Naum Ivanovski                                   #
# =========================================================#

# Get CPU utilization in % (Formula: 100 - idle CPU)
CPU_INFO=$(top -b -n 1 | grep "Cpu" | awk '{print "\tCPU Usage: "100-$8"%"}')

# Get RAM memory utilization (Formula: used/total MB (used/total*100%))
RAM_INFO=$(free -m | grep "Mem:" | awk '{print "\tRAM Usage: "$3"/"$2" MB (" $3/$2*100 "%)"}')

# Get SWAP memory utilization (Formula: used/total MB (used/total*100%))
SWAP_INFO=$(free -m | grep "Swap:" | awk '{print "\tSwap Usage: "$3"/"$2" MB (" $3/$2*100 "%)"}')

# Get Disk space
DISK_INFO=$(df -h | awk '{print "\t" $0}')

#====================# 
# Display statistics #
#====================#

clear

echo "Disk space:"
echo $DISK_INFO
echo ""

echo "Memory usage:"
echo $CPU_INFO
echo $RAM_INFO
echo $SWAP_INFO
echo ""

echo -n "Uptime:"
uptime
echo ""
