# maven-docker
#
# VERSION 1.0

FROM ubuntu:14.04.2
MAINTAINER EricoGR <ericomercial@yahoo.com.br>

#instala o mínimo para instalação dos pacotes
RUN \
  apt-get update && \
  apt-get install -y software-properties-common

#instala o java
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Variaveis de ambiente java e maven
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV M2_HOME /opt/apache-maven
ENV PATH $M2_HOME/bin:$PATH

#instala o maven
RUN \
  wget http://ftp.unicamp.br/pub/apache/maven/maven-3/3.3.1/binaries/apache-maven-3.3.1-bin.tar.gz && \
  tar zxvf apache-maven-3.3.1-bin.tar.gz && \
  mv apache-maven-3.3.1 /opt && \
  ln -s /opt/apache-maven-3.3.1 /opt/apache-maven && \
  rm apache-maven-3.3.1-bin.tar.gz

# Define working directory.
WORKDIR /data

# shell padrão
CMD ["bash"]