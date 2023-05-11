#!/bin/bash

echo "Calculating memory utilization percentage..."

MEM_INFO=$(cat /proc/meminfo)
mem_total=$(echo $MEM_INFO | awk '{print $2}')
mem_free=$(echo $MEM_INFO | awk '{print $5}')
buffers=$(echo $MEM_INFO | awk '{print $11}')
cached=$(echo $MEM_INFO | awk '{print $14}')
sreclaimable=$(echo $MEM_INFO | awk '{print $71}')

# Calculate memory utilization percentage
mem_util_percentage=$(echo "scale=2; (100 * ($mem_total - ($mem_free + $buffers + $cached + $sreclaimable)) / $mem_total)" | bc)

echo "Memory Utilization Percentage: $mem_util_percentage%"
