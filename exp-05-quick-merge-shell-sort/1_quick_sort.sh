#!/bin/bash
# Experiment 05 (1): Quick Sort in Shell Script

arr=(10 7 8 9 1 5)
n=${#arr[@]}

echo "Original Array: ${arr[@]}"

# Partition function modifies global array 'arr' and sets 'p_idx'
partition() {
    local low=$1
    local high=$2
    local pivot=${arr[high]}
    local i=$((low - 1))
    local j temp

    for ((j = low; j < high; j++))
    do
        if [ ${arr[j]} -le $pivot ]; then
            i=$((i + 1))
            temp=${arr[i]}
            arr[i]=${arr[j]}
            arr[j]=$temp
        fi
    done

    temp=${arr[$((i + 1))]}
    arr[$((i + 1))]=${arr[high]}
    arr[high]=$temp

    p_idx=$((i + 1))
}

# Recursive Quick Sort function
quick_sort() {
    local low=$1
    local high=$2
    if [ $low -lt $high ]; then
        partition $low $high
        local pi=$p_idx
        quick_sort $low $((pi - 1))
        quick_sort $((pi + 1)) $high
    fi
}

quick_sort 0 $((n - 1))
echo "Sorted Array (Quick Sort): ${arr[@]}"
