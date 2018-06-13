#!/usr/bin/env bash
gcloud docker -- pull gcr.io/robbie-ai-us/robbie-alpine-python/latest:latest
docker run --name tornado-cython --rm \
  -v ~/.pypirc:/root/.pypirc \
  -v ~/.pip:/root/.pip \
  -v $(pwd):/tornado \
  gcr.io/robbie-ai-us/robbie-alpine-python/latest:latest \
  bash -c "cd /tornado && pip install Cython setuptools && bash build_package.sh"
