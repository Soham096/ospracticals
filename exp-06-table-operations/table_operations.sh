#!/bin/bash
# Experiment 06: Merge 2 tables, remove duplicates, complete entries,
# sort by phone number, and count total users.

# Format: Name Phone_No City
cat << 'EOF' > table1.txt
Rahul 9876543210 Pune
Amit 9123456780 Mumbai
Sneha 9988776655
EOF

cat << 'EOF' > table2.txt
Priya 9011223344 Nagpur
Amit 9123456780 Mumbai
Karan 9765432109 Nanded
EOF

echo "=== TABLE 1 ==="
cat table1.txt
echo ""
echo "=== TABLE 2 ==="
cat table2.txt
echo ""

# 1. Merge 2 tables
cat table1.txt table2.txt > merged_table.txt
echo "=== 1. MERGED TABLE ==="
cat merged_table.txt
echo ""

# 2. Remove duplicate entries
sort -u merged_table.txt > unique_table.txt
echo "=== 2. AFTER REMOVING DUPLICATE ENTRIES ==="
cat unique_table.txt
echo ""

# 3. Add / fill incomplete entries (If 3rd column 'City' is missing, add default city)
awk '{if (NF < 3) print $1, $2, "Nanded"; else print $0}' unique_table.txt > complete_table.txt
echo "=== 3. AFTER COMPLETING INCOMPLETE ENTRIES ==="
cat complete_table.txt
echo ""

# 4. Sort table by Phone Number (Column 2)
sort -k2,2n complete_table.txt > sorted_table.txt
echo "=== 4. SORTED BY PHONE NUMBER (COLUMN 2) ==="
cat sorted_table.txt
echo ""

# 5. Count total users
total_users=$(wc -l < sorted_table.txt)
echo "=== 5. TOTAL NUMBER OF USERS: $total_users ==="
