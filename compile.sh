#!/bin/sh

# USAGE : ./compile wii

PLATFORM=$1

mkdir $PLATFORM

# Clean first
find . -name '*.o' -print0 | xargs -0r rm -f

# Compile cores
#for index in A B C D E F G ; do
for index in G ; do
    make platform=$PLATFORM SUBTARGET=core${index} -j5 || exit 1
	sleep 1
    mv mame2003_plus_core${index}_libretro_$PLATFORM.a ./$PLATFORM
    make platform=$PLATFORM SUBTARGET=core${index} clean || exit 1
	sleep 1
done

