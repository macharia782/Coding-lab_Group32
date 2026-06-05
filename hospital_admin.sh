#!/bin/bash

# Creates required directories if they do not already exist
initialize_system() {
    echo "--- Initializing KNH System ---"

    # Check and create active_logs directory for live sensor data
    if [ ! -d "active_logs" ]; then
        echo "Creating active_logs directory..."
        mkdir active_logs
    else
        echo "active_logs already exists."
    fi

    # Check and create archived_logs directory for rotated logs
    if [ ! -d "archived_logs" ]; then
        echo "Creating archived_logs directory..."
        mkdir archived_logs
    else
        echo "archived_logs already exists."
    fi

    # Check and create reports directory for analysis output
    if [ ! -d "reports" ]; then
        echo "Creating reports directory..."
        mkdir reports
    else
        echo "reports already exists."
    fi

    echo "Directories ready."
}

# Locks down active_logs so only the owner can read and write
secure_data() {
	chmod 700 active_logs
	echo "Permissions set on active_logs: "
	ls -l | grep active_logs
}
 
# Execution Logic: runs both functions in order
initialize_system
secure_data
echo "System Environment Secured - $(date)"
