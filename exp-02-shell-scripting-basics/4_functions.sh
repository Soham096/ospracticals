#!/bin/bash
# Experiment 02 (4): Functions in Shell

# Function to greet a user
greet_user() {
    echo "Welcome to OS Practicals, $1!"
}

# Function to add two numbers
add_numbers() {
    local sum=$(($1 + $2))
    echo "Sum of $1 and $2 is: $sum"
}

# Calling the functions with arguments
greet_user "Soham"
add_numbers 15 25
