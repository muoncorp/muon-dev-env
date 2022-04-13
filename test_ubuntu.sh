#!/bin/sh

docker build -f test/ubuntu/Dockerfile -t myenv_test_ubuntu .
docker run -it myenv_test_ubuntu
