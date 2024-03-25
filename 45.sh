#!/bin/bash

# Print the number 45 to the console in an infinite loop.
# Press 'q' to stop the script.

while true
do
    # Print the number 45 to the console.
    echo "45"

    # Check if the user has pressed the 'q' key to stop the script.
    if [ "$(cat /dev/tty)" = "q" ]; then
        break
    fi

    # Wait for a short period of time to reduce resource usage.
    sleep 0.1
done