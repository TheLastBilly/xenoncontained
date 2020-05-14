FROM ubuntu:12.04

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
                          vim

#Build and install texinfo
COPY ./scripts/install_texinfo.sh /install_texinfo.sh
RUN chmod +x /install_texinfo.sh && /install_texinfo.sh
RUN rm /install_texinfo.sh

#Build and install toolchain and libxenon
RUN mkdir -p /usr/local/xenon
RUN git clone git://github.com/TheLastBilly/libxenon
WORKDIR libxenon/toolchain 
RUN ./build-xenon-toolchain toolchain

#Add paths to it
RUN echo 'export DEVKITXENON="/usr/local/xenon"' >> /root/.bashrc
RUN echo 'export PATH="$PATH:$DEVKITXENON/bin:$DEVKITXENON/usr/bin"' >> /root/.bashrc

#Build and install libraries
RUN ./build-xenon-toolchain libs

#Add fish path scripts
COPY ./scripts/fish_entry.fish /fish_entry.fish
RUN chmod +x /fish_entry.fish

WORKDIR /mnt/share

CMD ["/bin/bash"]
