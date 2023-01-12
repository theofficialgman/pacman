#Container for compiling and running pacman_sdl
#tested on ubuntu 16.04
#docker build -t pacman_sdl .
#docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY pacman_sdl
FROM ubuntu:16.04
RUN apt-get update && apt-get install -y build-essential libsdl2-dev libsdl2-image-dev libsdl2-ttf-dev libsdl2-mixer-dev desktop-file-utils
COPY . /pacman_sdl
RUN cd /pacman_sdl && ./configure && make && make install
CMD /usr/local/bin/pacman_sdl
