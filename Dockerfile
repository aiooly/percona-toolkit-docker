FROM debian:8.6

COPY ./cn.list /etc/apt/sources.list
RUN apt-get update -q \
  && apt-get install -y wget \
  && wget https://repo.percona.com/apt/percona-release_0.1-4.jessie_all.deb -O /tmp/percona-release_0.1-4.jessie_all.deb \
  && dpkg -i /tmp/percona-release_0.1-4.jessie_all.deb \
  && rm -f /tmp/percona-release_0.1-4.jessie_all.deb

RUN apt-get update -q \
  && apt-get install -y percona-toolkit \
&& apt-get clean
