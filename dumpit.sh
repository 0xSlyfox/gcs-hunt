#!/bin/bash

# List all packages
packages=$(adb shell pm list packages | awk -F':' '{print $2}')

# Counter for the number of APKs pulled
counter=0

# Loop over all packages
for package in $packages
do
  echo "Processing $package..."
  # Get the path of the APK file on the device
  apk_path=$(adb shell pm path $package | awk -F':' '{print $2}')
  # Check if the APK path is not empty
  if [[ -z "$apk_path" ]]; then
    echo "No APK found for $package, skipping."
  else
    # Define the destination path with unique filename
    destination_path=$package.apk
    # Pull the APK file
    adb pull $apk_path $destination_path && let counter++
  fi
done

echo "$counter APK files dumped."

