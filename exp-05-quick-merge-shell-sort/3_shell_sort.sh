#!/bin/bash
# Experiment 05 (3): Shell Sort in Shell Script

arr=(23 12 1 8 34 54 2 3)
n=${#arr[@]}

echo "Original Array: ${arr[@]}"

# Start with a large gap, then reduce the gap by half each step
gap=$((n / 2))
while [ $gap -gt 0 ]
do
    for ((i = gap; i < n; i++))
    do
        temp=${arr[i]}
        j=$i

        # Shift earlier gap-sorted elements up until the right position is found
        while [ $j -ge $gap ] && [ ${arr[$((j - gap))]} -gt $temp ]
        do
            arr[j]=${arr[$((j - gap))]}
            j=$((j - gap))
        done
        arr[j]=$temp
    done
    gap=$((gap / 2))
done

echo "Sorted Array (Shell Sort): ${arr[@]}"
