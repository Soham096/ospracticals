#!/bin/bash
# Experiment 04 (2): Insertion Sort in Shell Script

arr=(12 11 13 5 6)
n=${#arr[@]}

echo "Original Array: ${arr[@]}"

# Insertion Sort logic
for ((i = 1; i < n; i++))
do
    key=${arr[i]}
    j=$((i - 1))

    # Move elements greater than key one position ahead
    while [ $j -ge 0 ] && [ ${arr[j]} -gt $key ]
    do
        arr[$((j + 1))]=${arr[j]}
        j=$((j - 1))
    done
    arr[$((j + 1))]=$key
done

echo "Sorted Array (Insertion Sort): ${arr[@]}"
