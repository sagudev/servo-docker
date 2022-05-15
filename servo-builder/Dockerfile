FROM ubuntu:20.04

RUN apt update \
    && apt install -y python3 python3-pip wget unzip \
    && python3 -m pip install --upgrade pip virtualenv
# bootstrap
RUN wget https://github.com/servo/servo/archive/refs/heads/master.zip &&\
    unzip servo-master.zip && cd servo-master &&\
    python3 ./mach bootstrap