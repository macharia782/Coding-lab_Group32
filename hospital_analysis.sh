#!/bin/bash

# Function to process critical vitals
process_vitals() {

    echo "Processing critical patient vitals..."

    mkdir -p reports

    grep -h "CRITICAL" active_logs/heart_rate_log.log active_logs/temperature_log.log 2>/dev/null | \
    awk -F' \\| ' '
    {
        printf "Timestamp: %s | Device_ID: %s | Value: %s\n", $1, $2, $3
    }' > reports/critical_alerts.txt

    echo "Critical alerts saved in reports/critical_alerts.txt"
}

# Function to audit water usage
water_audit() {

    echo "Analyzing ICU water reserve usage..."

    awk -F' \\| ' '
    /ICU_WATER_RESERVE/ {
        total += $3
        count++
    }

    END {
        if (count > 0) {
            average = total / count
            printf "Average ICU Water Usage: %.2f liters\n", average
        } else {
            printf "No ICU water data found.\n"
        }
    }' active_logs/water_usage_log.log 2>/dev/null
}

# Execute functions
process_vitals
water_audit

echo "Hospital analysis completed."
