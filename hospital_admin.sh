#!/bin/bash

initialize_system() {
    echo "--- Initializing KNH System ---"

    if [ ! -d "active_logs" ]; then
        echo "Creating active_logs directory..."
        mkdir active_logs
    else
        echo "active_logs already exists."
    fi

    if [ ! -d "archived_logs" ]; then
        echo "Creating archived_logs directory..."
        mkdir archived_logs
    else
        echo "archived_logs already exists."
    fi

    if [ ! -d "reports" ]; then
        echo "Creating reports directory..."
        mkdir reports
    else
        echo "reports already exists."
    fi

    echo "Directories ready."
}
secure_data() {
	# Only owner can read and write active_logs
	chmod 600 active_logs
	echo "Permissions set on active_logs: "
	ls -l | grep active_logs
}
 
# === Execution Logic ===
initialize_system
secure_data
echo "System Environment Secured - $(date)"
