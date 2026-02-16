#!/bin/bash

TIMEOUT=15
START_TIME=$(date +%s)

echo "Waiting for notification daemon..."

# Loop until the notification service appears on the D-Bus
until busctl --user list | grep -q "org.freedesktop.Notifications"; do
    CURRENT_TIME=$(date +%s)
    ELAPSED_TIME=$((CURRENT_TIME - START_TIME))
    
    if [ "$ELAPSED_TIME" -ge "$TIMEOUT" ]; then
        echo "Timeout waiting for notifications. Launching anyway."
        break
    fi
    sleep 0.5
done

echo "Notification daemon found! Launching application."

exec "$@"
