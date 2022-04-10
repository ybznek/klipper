container="$1"
sudo docker exec -ti "$container" bash -c 'echo RESTART > /tmp/printer'
