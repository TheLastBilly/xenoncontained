FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
                          gcc \
                          make \
                          git \
                          build-essential \
                          wget \
                          lsb-core lsb-release \
                          libgmp3-dev \
                          libmpfr-dev \
                          libmpc-dev \
                          git-core \
                          gettext \
                          ncurses-dev \
                          fish \
                          vim \
                          sudo \
                          flex \
                          bison \
                          gcc-multilib
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata                  
RUN apt-get autoremove

#Build and install texinfo
#COPY ./scripts/install_texinfo.sh /install_texinfo.sh
#RUN chmod +x /install_texinfo.sh && /install_texinfo.sh
#RUN rm /install_texinfo.sh

#Build and install toolchain and libxenon
RUN mkdir -p /usr/local/xenon
RUN cd /tmp && git clone https://github.com/unluckybudget/libxenon
WORKDIR /tmp/libxenon/toolchain 
RUN ./build-xenon-toolchain toolchain

#Add paths to it
ENV DEVKITXENON /usr/local/xenon
ENV PATH $DEVKITXENON/bin:$DEVKITXENON/usr/bin:$PATH

#Build and install libraries
RUN ./build-xenon-toolchain libs

RUN mkdir /mnt/share && chmod 777 /mnt/share
WORKDIR /mnt/share
RUN rm -rf /tmp/libxenon

CMD ["/bin/bash"]

