#!/bin/bash
# Experiment 01: Study of different shell commands in Linux

echo "=== 1. SYSTEM & USER INFORMATION ==="
echo "Current User      : $(whoami)"
echo "Current Date/Time : $(date)"
echo "System Kernel     : $(uname -sr)"
echo "Current Directory : $(pwd)"
echo ""

echo "=== 2. DIRECTORY & FILE OPERATIONS ==="
# Create a temporary test directory
mkdir -p demo_folder
echo "Created directory: demo_folder"

# Create sample files using echo and cp
echo "Hello Operating Systems Lab" > demo_folder/file1.txt
echo "Linux Shell Commands Practical" >> demo_folder/file1.txt
cp demo_folder/file1.txt demo_folder/file2_copy.txt
echo "Created file1.txt and copied to file2_copy.txt"

# List files with details
echo "Listing files in demo_folder (ls -l):"
ls -l demo_folder
echo ""

echo "=== 3. VIEWING & COUNTING FILE CONTENTS ==="
echo "Contents of file1.txt (using cat):"
cat demo_folder/file1.txt

echo "Word, line, and character count (using wc):"
wc demo_folder/file1.txt
echo ""

echo "=== 4. FILE PERMISSIONS & CLEANUP ==="
chmod 644 demo_folder/file1.txt
echo "Changed permissions of file1.txt to 644"

# Remove demo directory
rm -rf demo_folder
echo "Cleaned up demo_folder successfully."
