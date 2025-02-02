#!/bin/bash

# This script demonstrates a solution to the race condition bug using locks.

# Create two files
touch file1.txt
touch file2.txt

# Use a lock to prevent race conditions
(flock -x 200; echo "Process 1" > file1.txt) &
(flock -x 201; echo "Process 2" > file2.txt) &

# Wait for both processes to finish
wait

# Print the content of the files
cat file1.txt
cat file2.txt