#!/bin/bash

# Function to analyze log file
analyze_log() {
    log_file="$1"
    echo "Analyzing log file: $log_file"
    
    # Count occurrences of specific keywords or patterns
    error_count=$(grep -c "ERROR" "$log_file")
    warning_count=$(grep -c "WARNING" "$log_file")
    info_count=$(grep -c "INFO" "$log_file")
    
    # Generate summary report
    echo "Summary Report:"
    echo "----------------"
    echo "ERROR count: $error_count"
    echo "WARNING count: $warning_count"
    echo "INFO count: $info_count"
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

# Call analyze_log function with log file path
analyze_log "$log_file"
