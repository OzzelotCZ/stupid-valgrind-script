#!/bin/bash
#extremely dumb script to run valgrind on a piece of code in the current dir
#requires a docker img with valgrind in it
#usage: be in the directory with the cpp file in it and run this script on said file

MACHINE_NAME="valgrind-img"
MACHINE_VER="0.1"
COMPILER="g++"
COMPILER_ARGS="-Wall -pedantic -g"
if	[ $# -eq 0 ] ;then
	echo "usage: $0 file.cpp"
	exit 1
fi

docker run -ti -v $PWD:/test $MACHINE_NAME:$MACHINE_VER bash -c "cd /test/;$COMPILER $COMPILER_ARGS -o /tmp/test $1 && valgrind --leak-check=full /tmp/test;rm /tmp/test"
