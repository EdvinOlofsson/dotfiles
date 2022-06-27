#!/bin/bash

CRYPTO_VERSION=1.1.1 # For NSO 7.X
# CRYPTO_VERSION=1.0.2 # For NSO 6.X
VERSION_UL=$(echo $CRYPTO_VERSION | sed 's/\./_/g')
LOCAL=$HOME/local/openssl-${CRYPTO_VERSION}
export USE_SSL_DIR=${LOCAL}
export PARALLEL_BUILD=yes

echo "Rebuilding: " ${1} ${2}
# Build the crypo dependency
# buildCrypto

cd $HOME/dev/git
cd "./$1"
# Build the crypo dependency
if [ "$2" == "clean" ] ; then
    echo "Clean everything!"
    git clean -ffxd .
fi
# echo "git pull"
# git pull
source ./env.sh
echo "make otp"
make otp
echo "make all"
make all

cd ..
echo "Done"
export PARALLEL_BUILD=no

buildCrypto () {
    echo "Building crypto version ${CRYPTO_VERSION} at ${LOCAL}" 

    mkdir -p  ${LOCAL}
    cd $HOME/dev/git
    # git clone https://github.com/openssl/openssl
    cd openssl
    git checkout OpenSSL_${VERSION_UL}-stable

    # Un-comment the following lines if you plan to build 6.X branches

    ./config --prefix=${LOCAL} --openssldir=${LOCAL} shared -fPIC
    make
    make test
    make install
    # and then make otp:
}

