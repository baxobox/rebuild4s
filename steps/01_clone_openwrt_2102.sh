#!/bin/bash
ROOTDIR=$(pwd)
echo $ROOTDIR
if [ ! -e "$ROOTDIR/LICENSE" ]; then
    echo "Please run from root"
    exit 1
fi

cd $ROOTDIR
mkdir build
cd build

OPENWRT_FOLDER=openwrt-fresh-2102
git clone -b openwrt-21.02 --single-branch https://git.openwrt.org/openwrt/openwrt.git $OPENWRT_FOLDER
# https://github.com/anmansky/openwrt-21.02.0-rc2.git $OPENWRT_FOLDER
#-b openwrt-21.02 --single-branch https://git.openwrt.org/openwrt/openwrt.git $OPENWRT_FOLDER
cd $OPENWRT_FOLDER
echo "Current OpenWRT commit"
git log -1

# git go to specific tag if needed
#OPENWRT_TAG=3e09cc496912264df05487ef0fae656c75a18a41 rc2
OPENWRT_TAG=aeb7b57798c7274a0bc0bc0a18ce5b2acb4a851f
git reset --hard $OPENWRT_TAG

# note how to freeze feeds too if needed
# see https://github.com/openwrt/openwrt/commit/1d5aa4bde731905073dbfb96d9dfb9b480715505
