#!/bin/bash
# Experiment 03: Shell script to implement awk, grep, and sed commands

# Step 1: Create a sample employee file
cat << 'EOF' > employees.txt
101 Rahul CSE 50000
102 Priya IT 65000
103 Amit CSE 45000
104 Sneha ECE 70000
105 Rohan IT 55000
EOF

echo "=== ORIGINAL FILE (employees.txt) ==="
cat employees.txt
echo ""

# Step 2: GREP Command (Search patterns)
echo "=== 1. GREP COMMAND EXAMPLES ==="
echo "a) Find all employees in 'CSE' department:"
grep "CSE" employees.txt

echo "b) Count number of employees in 'IT' department (grep -c):"
grep -c "IT" employees.txt

echo "c) Display matching lines with line numbers (grep -n):"
grep -n "Sneha" employees.txt
echo ""

# Step 3: SED Command (Stream Editor - find & replace, delete)
echo "=== 2. SED COMMAND EXAMPLES ==="
echo "a) Replace 'CSE' with 'COMPUTER' (sed 's/old/new/g'):"
sed 's/CSE/COMPUTER/g' employees.txt

echo "b) Delete the 3rd line from display (sed '3d'):"
sed '3d' employees.txt
echo ""

# Step 4: AWK Command (Column processing & conditions)
echo "=== 3. AWK COMMAND EXAMPLES ==="
echo "a) Print only Employee Name (Col 2) and Salary (Col 4):"
awk '{print $2, "\t", $4}' employees.txt

echo "b) Print employees with Salary > 50000:"
awk '$4 > 50000 {print $2, "earns", $4}' employees.txt
