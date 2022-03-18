#!/bin/bash

# =========================================================#
# This script check for system resources and displays them #
# Author: Naum Ivanovski                                   #
# =========================================================#

# Colors
R="\e[1;31m"; # Red
G="\e[1;32m"; # Green
Y="\e[1;33m"; # Yellow
B="\e[1;34m"; # Blue
P="\e[1;35m"; # Purple
A="\e[1;36m"; # Aqua
W="\e[1;37m"; # White
RS="\e[0m";   # Reset Color

# Get CPU utilization in % (Formula: 100 - idle CPU)
CPU_INFO=$(top -b -n 1 | grep "Cpu" | awk '{print "\tCPU  Usage: "100-$8"%"}')

# Get RAM memory utilization (Formula: used/total MB (used/total*100%))
RAM_INFO=$(free -m | grep "Mem:" | awk '{print "\tRAM  Usage: "$3"/"$2" MB (" $3/$2*100 "%)"}')

# Get SWAP memory utilization (Formula: used/total MB (used/total*100%))
SWAP_INFO=$(free -m | grep "Swap:" | awk '{print "\tSwap Usage: "$3"/"$2" MB (" $3/$2*100 "%)"}')

# Get Number of CPU(s)
CPU_NUMBER=$(grep "cpu" /proc/stat | wc -l | awk '{print "\tNumber of CPU(s): "$0-1}')

#====================# 
# Display statistics #
#====================#
clear

echo -e "${A}Disk space:${G}"
df -h | awk '{print "\t" $0}'
echo ""

echo -e "${A}Memory usage:${G}"
echo "${CPU_NUMBER}"
echo "${CPU_INFO}"
echo "${RAM_INFO}"
echo "${SWAP_INFO}"
echo ""

echo -en "${A}Uptime:${G}"
uptime
echo -e "${RS}"
