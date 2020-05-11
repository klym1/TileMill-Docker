FROM mdillon/postgis

RUN apt-get update && apt-get install -y \
        software-properties-common

RUN add-apt-repository -r ppa:ubuntugis/ppa

RUN apt-get update && apt-get install -y \
        python-setuptools \
        python-dev \
        libpq-dev \
        libxml2 libxslt1.1 python-lxml \
        gdal-bin python-gdal \
        python-psycopg2 \
        python-argparse 
