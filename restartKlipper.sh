container="$1"
sudo docker exec -ti "$container" bash -c 'echo FIRMWARE_RESTART > /tmp/printer'
