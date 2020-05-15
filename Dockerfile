FROM debian:buster-slim

ENV XENON_BCORE=j4
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
                          gcc \
                          make \
                          git \
                          build-essential \
                          wget \
                          lsb-release \
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
                          gcc-multilib \
                          tzdata
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata                  
RUN apt-get autoremove

#Build and install toolchain
RUN mkdir -p /usr/local/xenon
RUN cd /tmp && git clone https://github.com/unluckybudget/libxenon
WORKDIR /tmp/libxenon/toolchain 
RUN ./build-xenon-toolchain toolchain - set PARALLEL=${XENON_BCORE}

#Add paths to it
ENV DEVKITXENON /usr/local/xenon
ENV PATH $DEVKITXENON/bin:$DEVKITXENON/usr/bin:$PATH

#Build and install libxenon
RUN ./build-xenon-toolchain libxenon - set PARALLEL=${XENON_BCORE}

#Build and install libraries
RUN ./build-xenon-toolchain libs - set PARALLEL=${XENON_BCORE}

#Set access for folder and user
RUN mkdir /mnt/share && chmod 757 -R /mnt/share
RUN adduser --home /mnt/share libxenon --shell /bin/bash
RUN echo 'unset HISTFILE' >> /etc/profile.d/disable.history.sh

WORKDIR /mnt/share
RUN rm -rf /tmp/libxenon && \
    rm -rf /var/lib/apt/lists/* && \
    apt autoremove -y

CMD ["/bin/bash"]

