FROM gitpod/workspace-full-vnc:latest


USER root

ENV SHELL=/bin/bash

# Install the latest rr.
RUN __RR_VERSION__="5.6.0" \
    && cd /tmp \
    && wget -qO rr.deb https://github.com/mozilla/rr/releases/download/${__RR_VERSION__}/rr-${__RR_VERSION__}-Linux-$(uname -m).deb \
    && sudo dpkg -i rr.deb \
    && rm -f rr.deb

# install dependencies
RUN apt update \
    && DEBIAN_FRONTEND=noninteractive apt install -y python3-virtualenv python3-pip \
    git curl autoconf ccache libx11-dev libfreetype6-dev \
    libgl1-mesa-dri libglib2.0-dev xorg-dev gperf g++ \
    build-essential cmake libssl-dev \
    liblzma-dev libxmu6 libxmu-dev \
    libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev \
    libgles2-mesa-dev libegl1-mesa-dev libdbus-1-dev \
    libharfbuzz-dev ccache clang libunwind-dev \
    libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev \
    libgstreamer-plugins-bad1.0-dev autoconf2.13 \
    libunwind-dev llvm-dev gstreamer1.0-nice gstreamer1.0-plugins-bad \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

# Compile with Clang 10.
ENV CC="clang"
ENV CXX="clang++"