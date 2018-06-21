
FROM ubuntu:rolling as build

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y \
    build-essential \
    git \
    lsb-release \
    sudo \
    udev \
    usbutils \
    wget
RUN apt-get clean all

RUN useradd -c "Movidius User" -m movidius
RUN echo "movidius ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/modivus_sudo_nopasswd
RUN mkdir -p /etc/udev/rules.d/

USER movidius
WORKDIR /home/movidius
RUN git clone https://github.com/movidius/ncsdk.git
WORKDIR /home/movidius/ncsdk

RUN make install
RUN make examples
