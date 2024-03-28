#!/bin/bash

image=$1
extract_to=images/$image

tar_file=image.tar
echo "Extracting $image to $extract_to"

mkdir -p $extract_to
docker save $image | tar -C $extract_to -xvf -

grep_for=$2
grep_from=images/$image/blobs/sha256

echo "Finding $grep_for in $grep_from..."
echo "Found $grep_for in:"

grep -r $grep_for $grep_from
