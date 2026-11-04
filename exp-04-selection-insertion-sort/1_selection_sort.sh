#!/bin/bash
# Experiment 04 (1): Selection Sort in Shell Script

arr=(64 25 12 22 11)
n=${#arr[@]}

echo "Original Array: ${arr[@]}"

# Selection Sort logic
for ((i = 0; i < n - 1; i++))
do
    min_idx=$i
    for ((j = i + 1; j < n; j++))
    do
        if [ ${arr[j]} -lt ${arr[min_idx]} ]; then
            min_idx=$j
        fi
    done

    # Swap arr[i] and arr[min_idx]
    temp=${arr[i]}
    arr[i]=${arr[min_idx]}
    arr[min_idx]=$temp
done

echo "Sorted Array (Selection Sort): ${arr[@]}"
