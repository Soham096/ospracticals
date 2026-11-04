#!/bin/bash
# Experiment 02 (2): Read Command Line Arguments
# Usage: ./2_command_line_args.sh Arg1 Arg2

echo "Script Name           : $0"
echo "Total Arguments Passed: $#"
echo "First Argument (\$1)   : ${1:-None}"
echo "Second Argument (\$2)  : ${2:-None}"
echo "All Arguments (\$@)    : $@"

# Also demonstrating interactive 'read' command
echo ""
read -p "Enter your name: " username
echo "Hello, $username!"
