FROM ubuntu:latest
RUN apt-get update -y; apt-get install -y git sudo
RUN useradd -ms /bin/bash octoprint
RUN bash -c 'echo "octoprint   ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers'
USER octoprint
RUN bash -c 'cd ~; git clone https://github.com/th33xitus/kiauh.git'
