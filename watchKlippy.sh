container="$1"
sudo docker exec -ti "$container" /bin/bash -c 'tail -f /tmp/klippy.log'


