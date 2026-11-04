#!/bin/bash
# Experiment 02 (3): Case Statement (Simple Menu Calculator)

a=20
b=5
echo "Numbers are: a=$a, b=$b"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
read -p "Enter your choice (1-4): " choice

case $choice in
    1)
        echo "Result: $((a + b))"
        ;;
    2)
        echo "Result: $((a - b))"
        ;;
    3)
        echo "Result: $((a * b))"
        ;;
    4)
        echo "Result: $((a / b))"
        ;;
    *)
        echo "Invalid choice! Please enter 1 to 4."
        ;;
esac
