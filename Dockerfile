FROM ubuntu:18.04 AS Mapnik

ENV BOOST_INSTALL_VERSION=1.60.0 \
    MAPNIK_INSTALL_VERSION=3.0.21 \
    PATH=/usr/pgsql-11/bin:$PATH \
    CC=/usr/bin/clang \
    CXX=/usr/bin/clang++ \
    LD_LIBRARY_PATH=/usr/local/lib

RUN apt-get update && apt-get install -y \
        build-essential \
        libboost-filesystem-dev \
        libboost-program-options-dev \
        libboost-python-dev libboost-regex-dev \
    	libboost-system-dev libboost-thread-dev \
        libicu-dev \
	    python3-dev libxml2 libxml2-dev \
	    libfreetype6 libfreetype6-dev \
	    libharfbuzz-dev \
	    libjpeg-dev \
	    libpng-dev \
	    libproj-dev \
	    libtiff-dev \
	    clang \
	    libcairo2-dev python3-cairo-dev \
	    libcairomm-1.0-dev \
	    ttf-unifont ttf-dejavu ttf-dejavu-core ttf-dejavu-extra \
	    git \
	    python3-nose \
    	libgdal-dev python3-gdal 
    
    # Install required Boost components
WORKDIR /opt
   
    # Install Mapnik
RUN cd /opt && \
    git clone -b v${MAPNIK_INSTALL_VERSION} --single-branch --recursive https://github.com/mapnik/mapnik.git mapnik-${MAPNIK_INSTALL_VERSION} && \
    cd /opt/mapnik-${MAPNIK_INSTALL_VERSION} 


WORKDIR /opt/mapnik-${MAPNIK_INSTALL_VERSION}     
RUN ./configure CXX=clang++ CC=clang && \
    make && \
    make install && \
    # Cleanup source downloads and install working folders
    rm -rf /opt/mapnik*

WORKDIR /opt/
RUN git clone https://github.com/tilemill-project/tilemill.git

WORKDIR /opt/tilemill

RUN apt-get install -y \
 node-gyp \
 libssl1.0-dev \
 nodejs \
 curl \
 npm \
 nano     

RUN node -v
RUN npm -v

RUN npm install

ENTRYPOINT ["npm", "start"]
