FROM docker.1ms.run/library/ubuntu:latest
RUN apt update && \
    apt install -y busybox vim curl git && \
    apt install -y flex bison libssh-dev cpio bc proxychains  && \ 
    apt install -y gcc-aarch64-linux-gnu g++-aarch64-linux-gnu && \
    apt install -y build-essential && \
    apt install -y openssh-server  && \
    mkdir -p /run/sshd && chmod 755 /run/sshd 
RUN echo 'root:root' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/UsePAM yes/UsePAM no/' /etc/ssh/sshd_config
EXPOSE 22
