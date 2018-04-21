#!/bin/bash

FRP_VER="v0.16.1"
PKG_VER="0.16.1-1"

WORK_PATH=$(dirname $(readlink -f $0))
BUILD_SCRIPT=$WORK_PATH/build.sh

$BUILD_SCRIPT $FRP_VER mipsle $PKG_VER mipsel
$BUILD_SCRIPT $FRP_VER arm $PKG_VER arm

exit 0
