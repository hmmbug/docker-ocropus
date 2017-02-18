FROM ubuntu:14.04
MAINTAINER Tom <tmbdev@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update && \
    apt-get -qq dist-upgrade && \
    apt-get -qqy install build-essential g++ gdb swig2.0 mercurial scons \
    apt-get -qqy install curl python-scipy python-matplotlib python-tables \
        firefox imagemagick python-opencv python-bs4 git && \
    apt-get remove --purge build-essential g++ gdb mercurial scons && \
    apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* && \
    git clone https://github.com/tmbdev/ocropy.git && \
    (cd ocropy/models && curl -O http://www.tmbdev.net/en-default.pyrnn.gz) && \
    (cd ocropy && sudo python setup.py install) && \

ADD ocrotrain.sh ocropy/ocrotrain.sh
VOLUME /work
WORKDIR /work
