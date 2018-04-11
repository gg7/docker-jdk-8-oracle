FROM ubuntu:16.04

RUN echo '2018-04-11' && \
    apt-get -qq update && \
    DEBIAN_FRONTEND=noninteractive apt-get -qq install software-properties-common && \
    echo 'oracle-java8-installer shared/accepted-oracle-license-v1-1 select true' | debconf-set-selections && \
    add-apt-repository -y ppa:webupd8team/java && \
    DEBIAN_FRONTEND=noninteractive apt-get -qq update && \
    DEBIAN_FRONTEND=noninteractive apt-get -qq install oracle-java8-installer && \
    rm -rf /var/lib/apt/lists/* /var/cache/*

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
