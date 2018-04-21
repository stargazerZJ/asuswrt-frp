#!/bin/bash

FRP_VER=$1
FRP_ARCH=$2
PKG_VER=$3
PKG_ARCH=$4

WORK_PATH=$(dirname $(readlink -f $0))
TEMP_PATH=$WORK_PATH/tmp
RELEASE_PATH=$WORK_PATH/packages
IPKG_BUILD=$WORK_PATH/ipkg-build

rm -rf $TEMP_PATH >/dev/null 2>&1
mkdir $TEMP_PATH
mkdir $RELEASE_PATH >/dev/null 2>&1

echo "Building $PKG_VER for ${FRP_ARCH}..."

cd $TEMP_PATH
wget https://github.com/fatedier/frp/releases/download/${FRP_VER}/frp_${FRP_VER:1}_linux_${FRP_ARCH}.tar.gz
tar -zxvf frp_${FRP_VER:1}_linux_${FRP_ARCH}.tar.gz -C ../../pkg_file/opt/bin/ frp_${FRP_VER:1}_linux_${FRP_ARCH}/frpc --strip-components 1
tar -zxvf frp_${FRP_VER:1}_linux_${FRP_ARCH}.tar.gz -C ../../pkg_file/opt/etc/frp/ frp_${FRP_VER:1}_linux_${FRP_ARCH}/frpc.ini --strip-components 1
rm frp_${FRP_VER:1}_linux_${FRP_ARCH}.tar.gz
sed -i "/Architecture/c\Architecture: $PKG_ARCH" ../../pkg_file/CONTROL/control
sed -i "/Version/c\Version: $PKG_VER" ../../pkg_file/CONTROL/control
$IPKG_BUILD -c -o admin -g root ../../pkg_file ./ >/dev/null 2>&1

mv -f frp_${PKG_VER}_${PKG_ARCH}.ipk $RELEASE_PATH/
echo "Build complete: $RELEASE_PATH/frp_${PKG_VER}_${PKG_ARCH}.ipk"

exit 0
