#!/bin/bash
IMAGE_NAME=maven-docker:1.0

echo "====================="

docker build -t $IMAGE_NAME .

echo ""
echo "Maven Docker Container pronto para ser usado."