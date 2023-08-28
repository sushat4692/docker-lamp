#!/bin/bash

if [ $# -eq 0 ]; then
echo "No command specified."
echo "Usage: command.sh [delete|start|stop|up] [php version]?"
exit 1
fi

# Get Container Option Files
ALL_CONTAINER_OPTIONS=" -f docker-compose.yml"
CONTAINER_PATHS="./docker-compose.php*.yml"
for FILE in $CONTAINER_PATHS; do
    ALL_CONTAINER_OPTIONS+=" -f $FILE"
done

case $1 in
delete)
echo "Delete containers..."
docker-compose $ALL_CONTAINER_OPTIONS down --rmi all --volumes --remove-orphans
exit 1
;;
stop)
echo "Stop containers..."
docker-compose $ALL_CONTAINER_OPTIONS stop
exit 1
;;
esac

CONTAINER="docker-compose.php${2:-"81"}.yml"

if [ ! -f $CONTAINER ]; then
echo "No specified container."
echo $CONTAINER
exit 1
fi

case $1 in
up)
echo "Up containers..."
docker-compose -f docker-compose.yml -f $CONTAINER up
;;
start)
echo "Start containers..."
docker-compose -f docker-compose.yml -f $CONTAINER start
;;
*)
echo "Invalid command."
echo "Usage: command.sh [delete|start|stop|up] [php version]?"
exit 1
;;
esac
