#! /bin/bash

# BIOL 7863 Assignment 2
# Created by: Emily Adamic
# This is the parent script.
# It will create "child_script.sh", and then run it.
# In turn, "child_script.sh" creates & compresses the desired subset.

echo "Creating child script....."

cat > child_script.sh << CHILDSCRIPT

# Create the subset, order by Trappability, save to an intermediate file.
grep -E BTS0[1-8] BTS_data.txt | cut -f1,2,4 | sort -k3nr > child_subset.txt
echo "Created & sorted the subset....."

# Get the header, save to a file
head -1 BTS_data.txt | cut -f1,2,4 > "child_header.txt"
echo "Created the header....."

# Bind the two files, save to a new file.
cat child_header.txt child_subset.txt > child.txt
echo "Catted the files....."

# Remove the intermediates.
rm child_header.txt child_subset.txt
echo "Removed intermediates....."

# Compress final output to a .gz file.
gzip child.txt
echo "Zipped final file....."

echo "Child script done!"

CHILDSCRIPT


# Now run the child script.
echo "Running child script....."
./child_script.sh

echo "Parent script done! Child script and compressed output should be in directory."
