# Proof of Concept - Docker Image Secret Extraction

This repository contains proof of concept code for extracing "secret" files that
shouldn't be in the image from a Docker image. This is **not a vulnerability**
but a feature of Docker - this repository stands as proof that secrets **SHOULD
NOT** be stored in Docker images.

After reading that "best practice" suggests that one should “Never put any
secret or credentials in the Dockerfile instructions (environment variables,
args, or hard coded into any command)” (Álvaro Iradier, 2021)[^1] and seeing how
often this practice is ignored, I questioned how easy it would be to extract
secrets from a Docker image.

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

## References

[^1]:
    Álvaro Iradier (2021). _Top 20 Dockerfile best practices._ [online] Sysdig.
    Available at: <https://sysdig.com/blog/dockerfile-best-practices/> [Accessed
    28 Mar. 2024].
