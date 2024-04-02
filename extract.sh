#!/bin/bash

image=$1
grep_for=$2
extract_to=images/$image

echo "Extracting $image to $extract_to\n"

mkdir -p $extract_to
docker save $image | tar -C $extract_to -xvf -

echo "\nFinding $grep_for in $extract_to\n"
echo "Found $grep_for in:"

grep -r $grep_for $extract_to
