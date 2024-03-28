# Proof of Concept - Docker Image Secret Extraction

This repository contains proof of concept code for extracing "secret" files
that shouldn't be in the image from a Docker image. This is **not a
vulnerability** but a feature of Docker - this repository stands as proof that
secrets **SHOULD NOT** be stored in Docker images.

## Usage

```bash
# Find "something_that_should_not_be_found" in the image
$ ./extract.sh <image> "something_that_should_not_be_found"
# ...
Found something_that_should_not_be_found in:
grep: images/<image>/blobs/sha256/...

# For example
$ ./extract <image> "private_key"
# ...
Found something_that_should_not_be_found in:
grep: images/<image>/blobs/sha256/...
```
