#!/bin/bash

#POSTGRES
curl --url "$POSTGRES_PACKAGE_URL" --output ./ops/postgresql.tar.gz
tar -zxvf postgresql.tar.gz
cd postgresql
./configure  --with-openssl --bindir=/usr/bin
make
sudo make install
cd ..

#POSTGIT
export LD_LIBRARY_PATH=/usr/local/pgsql/lib/:LD_LIBRARY_PATH
curl --url "$POSTGIST_PACKAGE_URL" --output ./ops/postgis.tar.gz
tar -xvf postgis.tar.gz
cd postgis
./configure
make
sudo make install
cd ..
