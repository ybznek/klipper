FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y sudo git

# Create user
RUN useradd -ms /bin/bash klippy && adduser klippy dialout
USER klippy

#This fixes issues with the volume command setting wrong permissions
RUN mkdir /home/klippy/.config
VOLUME /home/klippy/.config

### Klipper setup ###
WORKDIR /home/klippy

USER klippy
RUN git clone https://github.com/Klipper3d/klipper
USER root
RUN echo 'klippy ALL=(ALL:ALL) NOPASSWD: ALL' > /etc/sudoers.d/klippy && \
    chown klippy:klippy -R klipper
# This is to allow the install script to run without error
RUN ln -s /bin/true /bin/systemctl
USER klippy
RUN ./klipper/scripts/install-ubuntu-18.04.sh
# Clean up install script workaround
RUN sudo rm -f /bin/systemctl

USER root
RUN apt-get install -y python3-pip python3-venv

USER klippy

RUN python3 -m venv OctoPrint; OctoPrint/bin/pip install OctoPrint

ADD serveOctoprint /
ADD klipper /
ADD service /
CMD /service
