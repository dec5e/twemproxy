#!/bin/bash
#file   : travis.sh
#author : ning
#date   : 2014-05-10 16:54:43

set -e

#build twemproxy
CFLAGS="-ggdb3 -O0" autoreconf -fvi && ./configure --enable-debug=log && make

ln -s $HOME/src/nutcracker  tests/_binaries/
cp `which redis-server` tests/_binaries/
cp `which redis-cli` tests/_binaries/
cp `which memcached` tests/_binaries/

#run test
cd tests/ && nosetests --nologcapture -x -v

