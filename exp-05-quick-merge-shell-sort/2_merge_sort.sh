#!/bin/bash
# Experiment 05 (2): Merge Sort in Shell Script

arr=(38 27 43 3 9 82 10)
n=${#arr[@]}

echo "Original Array: ${arr[@]}"

# Function to merge two halves arr[l..m] and arr[m+1..r]
merge() {
    local l=$1
    local m=$2
    local r=$3

    local i=$l
    local j=$((m + 1))
    local temp=()

    while [ $i -le $m ] && [ $j -le $r ]
    do
        if [ ${arr[i]} -le ${arr[j]} ]; then
            temp+=(${arr[i]})
            i=$((i + 1))
        else
            temp+=(${arr[j]})
            j=$((j + 1))
        fi
    done

    while [ $i -le $m ]; do
        temp+=(${arr[i]})
        i=$((i + 1))
    done

    while [ $j -le $r ]; do
        temp+=(${arr[j]})
        j=$((j + 1))
    done

    # Copy sorted elements back into original array
    local k
    for ((k = 0; k < ${#temp[@]}; k++))
    do
        arr[$((l + k))]=${temp[k]}
    done
}

# Recursive Merge Sort function
merge_sort() {
    local l=$1
    local r=$2
    if [ $l -lt $r ]; then
        local m=$(((l + r) / 2))
        merge_sort $l $m
        merge_sort $((m + 1)) $r
        merge $l $m $r
    fi
}

merge_sort 0 $((n - 1))
echo "Sorted Array (Merge Sort): ${arr[@]}"
