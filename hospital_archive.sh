#!/bin/bash

# Where active logs are stored
ACTIVE_DIR="active_logs"

# Where archived logs are moved
ARCHIVE_DIR="archived_logs"

# Creates the current date and time for each file
TIMESTAMP=$(date +"%Y%m%d_%H%M")


mkdir -p "$ARCHIVE_DIR"

for log_file in "$ACTIVE_DIR"/*.log; do
 base_name=$(basename "$log_file" .log)

# Moves the log files to archived_logs renamed with timestamps
mv "$log_file" "$ARCHIVE_DIR/${base_name}_${TIMESTAMP}.log"

# Print confirmation of which file was archived and its new timestamped name
echo "Archived: ${base_name}_${TIMESTAMP}.log"

# Recreates a fresh empty log file in active_logs
touch "$log_file"

# Print confirmation that a fresh empty log file has been recreated
echo "Recreated empty: ${base_name}.log"

done

# Print completion message once all log files have been rotated
echo "Log rotation complete."
