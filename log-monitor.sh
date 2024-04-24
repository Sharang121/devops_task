#!/bin/bash

# Function to monitor log file
monitor_log() {
    log_file="$1"
    echo "Monitoring log file: $log_file"
    
    # Start tail command to continuously monitor log file
    tail -f "$log_file" &
    tail_pid=$!
    
    # Wait for user input to stop monitoring
    trap 'kill $tail_pid; echo "Monitoring stopped."; exit' INT
    wait $tail_pid
}

# Main script logic
if [ $# -ne 1 ]; then
    echo "Usage: $0 <log_file_path>"
    exit 1
fi

log_file="$1"

# Check if log file exists
if [ ! -f "$log_file" ]; then
    echo "Error: Log file not found at path: $log_file"
    exit 1
fi

# Call monitor_log function with log file path
monitor_log "$log_file"
