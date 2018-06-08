FROM hpidcock/redis:5.0
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update \
  && apt-get -y upgrade \
  && apt-get -y --no-install-recommends install ruby wget \
  && gem install redis -v 3.3.5 \
  && apt-get -y autoremove \
  && apt-get -y clean
RUN wget -O /usr/local/bin/redis-trib https://raw.githubusercontent.com/antirez/redis/4.0/src/redis-trib.rb
RUN chmod 755 /usr/local/bin/redis-trib
CMD redis-server
