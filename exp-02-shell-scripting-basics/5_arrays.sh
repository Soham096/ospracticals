#!/bin/bash
# Experiment 02 (5): Arrays in Shell

# Declare an array
os_list=("Linux" "Windows" "macOS" "Ubuntu" "PopOS")

# Print specific element (0-indexed)
echo "First Element  : ${os_list[0]}"
echo "Third Element  : ${os_list[2]}"

# Add a new element to the array
os_list+=("Fedora")

# Print all elements and length
echo "All Elements   : ${os_list[@]}"
echo "Total Elements : ${#os_list[@]}"

# Loop through array elements
echo "--- Looping through Array ---"
for item in "${os_list[@]}"
do
    echo "OS: $item"
done
