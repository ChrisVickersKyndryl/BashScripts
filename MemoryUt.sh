#!/bin/bash

echo "Calculating memory utilization percentage..."

# Retrieve memory information using 'free' command
memory_info=$(free | awk 'NR==2{print $2,$3,$6,$7,$8}')

# Separate memory values
mem_total=$(echo $memory_info | awk '{print $1}')
mem_free=$(echo $memory_info | awk '{print $2}')
buffers=$(echo $memory_info | awk '{print $3}')
cached=$(echo $memory_info | awk '{print $4}')
sreclaimable=$(echo $memory_info | awk '{print $5}')

# Calculate memory utilization percentage
mem_util_percentage=$(echo "scale=2; (100 * ($mem_total - ($mem_free + $buffers + $cached + $sreclaimable)) / $mem_total)" | bc)

echo "Memory Utilization Percentage: $mem_util_percentage%"
