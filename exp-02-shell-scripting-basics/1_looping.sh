#!/bin/bash
# Experiment 02 (1): Looping in Shell Scripting

echo "--- FOR LOOP (Print numbers 1 to 5) ---"
for i in 1 2 3 4 5
do
    echo "Iteration: $i"
done

echo ""
echo "--- WHILE LOOP (Countdown from 3) ---"
count=3
while [ $count -gt 0 ]
do
    echo "Count is: $count"
    count=$((count - 1))
done

echo ""
echo "--- UNTIL LOOP (Run until num becomes 3) ---"
num=1
until [ $num -gt 3 ]
do
    echo "Number: $num"
    num=$((num + 1))
done
