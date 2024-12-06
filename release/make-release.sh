#!/bin/bash
set -ex

FRP_VER="v0.61.0"
PKG_VER="0.61.0"

WORK_PATH=$(dirname $(readlink -f $0))
BUILD_SCRIPT=$WORK_PATH/build.sh

# $BUILD_SCRIPT $FRP_VER mipsle $PKG_VER mipsel
$BUILD_SCRIPT $FRP_VER arm $PKG_VER arm

exit 0
