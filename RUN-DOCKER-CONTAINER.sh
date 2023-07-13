#!/bin/bash

################################################################################

# Set the Docker container name from a project name (first argument).
# If no argument is given, use the current user name as the project name.
if [ ! -z $1 ]; then
  PROJECT=$1
elif [ -z $PROJECT_NAME ]; then
  echo "Set PROJECT_NAME (e.g. 'export PROJECT_NAME=mytest')"
  exit 1
else
  PROJECT=$PROJECT_NAME
fi

CONTAINER="${PROJECT}_pytorch_1"
echo "$0: PROJECT=${PROJECT}"
echo "$0: CONTAINER=${CONTAINER}"

# Run the Docker container in the background.
# Any changes made to './docker/docker-compose.yml' will recreate and overwrite the container.
docker-compose -p ${PROJECT} -f ./docker/docker-compose.yml up -d

################################################################################

# Display GUI through X Server by granting full access to any external client.
xhost +

################################################################################

# Enter the Docker container with a Bash shell (with or without a custom 'roslaunch' command).
case "$2" in
  ( "" )
  docker exec -i -t ${CONTAINER} bash
esac
