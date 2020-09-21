#! /bin/bash

# Create the subset, order by Trappability, save to an intermediate file.
grep -E BTS0[1-8] BTS_data.txt | cut -f1,2,4 | sort -k3nr > child_subset.txt

echo "Created subset....."

# Get the header, save to a file
head -1 BTS_data.txt | cut -f1,2,4 > "child_header.txt"

echo "Created header....."

# Bind the two files, save to a new file.
cat child_header.txt child_subset.txt > child.txt

echo "Catted files....."

# Remove the intermediates.
rm child_header.txt child_subset.txt

echo "Removed intermediates....."

# Compress the final output to a .gz file.
gzip child.txt

echo "Zipped final file...."
echo "Child script done!"
