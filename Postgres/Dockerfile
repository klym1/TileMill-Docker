FROM mdillon/postgis

ENV POSTGRES_PASSWORD "postgres"
ENV POSTGRES_USER "postgres"

RUN apt-get update && apt-get install -y \
        software-properties-common \
        git \
        nano \
        python-setuptools \
        python3-dev \
        python3-pip \
        python3-psycopg2 \
        python-configparser \
        libpq-dev \
        libxml2 libxslt1.1 python3-lxml \
        gdal-bin \
        python3-gdal 

WORKDIR /opt

RUN git clone https://github.com/nlextract/NLExtract.git NLExtract
WORKDIR /opt/NLExtract

RUN cp /opt/NLExtract/bag/extract.conf /opt/NLExtract/bag/src/extract.conf