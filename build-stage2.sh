# _     _            _        _          _____
#| |__ | | __ _  ___| | _____| | ___   _|___ /
#| '_ \| |/ _` |/ __| |/ / __| |/ / | | | |_ \
#| |_) | | (_| | (__|   <\__ \   <| |_| |___) |
#|_.__/|_|\__,_|\___|_|\_\___/_|\_\\__, |____/
#                                  |___/

#Maintainer: blacksky3 <https://github.com/blacksky3>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->glibc->binutils->gcc
# NOTE: valgrind requires rebuilt with each major glibc version
# NOTE: libtool requires rebuilt with each new gcc version

#!/bin/bash

source=$(pwd)

echo "${source}"

# build stage2

cd glibc-stage2 && makepkg -si --nocheck && cd ${source}

cd binutils-stage2 && makepkg -si --nocheck && cd ${source}

cd gcc-stage2 && makepkg -si --nocheck && cd ${source}

# make a copy of every pkg in package dir

mkdir -p package

cp -v linux-api-headers-git/*.pkg.tar.zst package/

cp -v glibc-stage2/*.pkg.tar.zst package/

cp -v binutils-stage2/*.pkg.tar.zst package/

cp -v gcc-stage2/*.pkg.tar.zst package/

# clean build dir

rm -rf */src/
rm -rf */pkg/
