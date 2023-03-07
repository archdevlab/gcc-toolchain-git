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

# build linux-api-headers

cd linux-api-headers-git && makepkg -si && cd ${source}

# build stage1

cd glibc-stage1 && makepkg -si --nocheck && cd ${source}

cd binutils-stage1 && makepkg -si --nocheck && cd ${source}

cd gcc-git-stage1 && makepkg -si --nocheck && cd ${source}
