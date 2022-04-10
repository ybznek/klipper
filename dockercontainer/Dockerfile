FROM ubuntu:20.04

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
RUN bash -c 'git clone https://github.com/Klipper3d/klipper'
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

RUN python3 -m venv OctoPrint; OctoPrint/bin/pip install wheel;OctoPrint/bin/pip install OctoPrint; OctoPrint/bin/pip install --upgrade OctoPrint # upgrade due to some issues


# moonsail
USER root
RUN apt install -y python3-virtualenv python3-dev libopenjp2-7  curl libcurl4-openssl-dev libssl-dev liblmdb-dev libsodium-dev zlib1g-dev libjpeg-dev \
iproute2 # python3-libgpiod
USER klippy
RUN git clone https://github.com/Arksine/moonraker.git; \
	cd /home/klippy/; \
	virtualenv -p python3 ./moonraker-env; \
	./moonraker-env/bin/pip install -r ./moonraker/scripts/moonraker-requirements.txt 
ADD moonraker.conf /home/klippy/klipper_config/moonraker.conf


ADD serveOctoprint /
ADD klipper /
ADD moonraker /
ADD serviceRunner /
ADD service /
CMD /service
