FROM postgres:15.2

ENV POSTGIS_VERSION 3.3.2
ENV POSTGRES_HOST_AUTH_METHOD trust

RUN apt-get update \
      && apt-get install -y --no-install-recommends \
            libxml2-dev libproj-dev libgeos-dev libgdal-dev libkrb5-dev \
            wget cmake make g++ libboost-dev libcgal-dev libdata-dump-perl \
            protobuf-compiler protobuf-c-compiler libprotobuf-dev proj-bin \
            libprotobuf-c-dev libprotobuf-c1 postgresql-server-dev-$PG_MAJOR

RUN wget --no-check-certificate https://download.osgeo.org/postgis/source/postgis-$POSTGIS_VERSION.tar.gz \
      && tar xvzf postgis-$POSTGIS_VERSION.tar.gz \
      && cd postgis-$POSTGIS_VERSION \
      && ./configure \
      && make \
      && make install \
      && cd ../.. \
      && rm -Rf postgis-$PGROUTING_VERSION \
      && rm postgis-$POSTGIS_VERSION.tar.gz
