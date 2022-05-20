FROM node:latest

ENV TERM=xterm-color
ENV DEBIAN_FRONTEND=noninteractive

RUN \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y libbsd-dev && \
    apt-get install -y libc6-dbg gdb valgrind && \
    apt-get install -y pkg-config && \
    apt-get install -y libfuse-dev && \
    apt-get install -y build-essential bash-completion && \
    apt-get install -y software-properties-common && \
    apt-get install -y byobu curl git htop man unzip vim wget time && \
    apt-get install -y fuse && \
    apt-get update -y && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*

#RUN \
#    curl -fsSL https://deb.nodesource.com/setup_18.x | bash; \
#    apt-get install -y nodejs

WORKDIR /usr/src/potree
RUN git clone https://github.com/potree/potree.git; \
    cd potree; \
    npm install;

VOLUME "/templates"

# Drop into an interactive shell and source the bashrc.
ENTRYPOINT ["bash","-i"]
