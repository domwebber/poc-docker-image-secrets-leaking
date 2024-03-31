#!/bin/bash

image=$1
extract_to=images/$image

tar_file=image.tar
echo "Extracting $image to $extract_to"

mkdir -p $extract_to
docker save $image | tar -C $extract_to -xvf -

grep_for=$2

echo "Finding $grep_for in $extract_to..."
echo "Found $grep_for in:"

grep -r $grep_for $extract_to
