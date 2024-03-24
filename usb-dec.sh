#!/bin/bash

# Function to check for USB devices
check_usb() {
    local current_devices=""
    local new_devices=""

    # Save the current list of USB devices
    current_devices=$(lsusb)

    # Wait for 1 second
    sleep 1

    # Get the new list of USB devices
    new_devices=$(lsusb)

    # Compare the two lists to find new devices
    diff <(echo "$current_devices") <(echo "$new_devices") | grep -E '^[+]' > /dev/null

    # Check the exit code of the previous command (0 if a new device was detected)
    if [ $? -eq 0 ]; then
        echo "New USB device detected!"
    fi
}

# Call the function to check for USB devices
check_usb