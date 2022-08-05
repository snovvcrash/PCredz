FROM amd64/ubuntu:20.04
LABEL maintainer="snovvcrash@protonmail.ch"
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt update && apt install python3-pip libpcap-dev -y && pip3 install Cython && pip3 install python-libpcap
COPY . /PCredz
ENTRYPOINT ["/PCredz/Pcredz"]
