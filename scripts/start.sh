#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
docker pull subhanrider/php-application

# Run the Docker image as a container
docker run -d -p 80:80 subhanrider/php-application
