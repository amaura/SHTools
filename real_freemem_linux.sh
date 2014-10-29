#!/bin/bash
# Display Free memory on Linux when Oracle is running and not using huge pages
#
# Author : Amaury FRANCOIS (Oracle)
echo "Free Memory (Free + Cached): "
SYSFREE=$(free -m | grep "buffers/cache" | awk '{print $4}')
echo "$SYSFREE MB"
echo "Sum of SGAs : "
SGAS=$(echo "$(ipcs -m | grep oracle | awk '{print $5}'|paste -sd+ | bc)/1024/1024"|bc)
echo "$SGAS MB"
echo "Real Free Memory : "
echo "$(echo "$SYSFREE-$SGAS"|bc) MB"
