#!/usr/bin/env bash
set -e
apk add --update build-base
python3 setup.py bdist bdist_wheel upload -r robbie_pypicloud
rm -rf dist && rm -rf build && rm -rf *.egg-info
mv ./tornado/speedups.c ./tornado/speedups.c.bak
find . -name "*.c" -delete
find . -name "*.pyc" -delete
mv ./tornado/speedups.c.bak ./tornado/speedups.c
