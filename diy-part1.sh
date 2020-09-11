#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# sed -i '$a src-git kenzok8 https://github.com/kenzok8/openwrt-packages' feeds.conf.default
# sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
#sed -i '$a src-git vernesong https://github.com/vernesong/OpenClash' feeds.conf.default
#sed -i '$a src-git jefferymvp https://github.com/jefferymvp/luci-app-koolproxyR' feeds.conf.default

#sed -i '$a src-git liuran001_packages https://github.com/liuran001/openwrt-packages' feeds.conf.default

git clone https://github.com/jerrykuku/lua-maxminddb.git  #git lua-maxminddb 依赖
git clone https://github.com/jerrykuku/luci-app-vssr.git 

# 修改openwrt登陆地址,把下面的192.168.2.2修改成你想要的就可以了
sed -i 's/192.168.1.1/192.168.1.4/g' ./package/base-files/files/bin/config_generate

# 修改主机名字，把OpenWrt-123修改你喜欢的就行（不能纯数字或者使用中文）
sed -i 's/OpenWrt/OpenWrtAA/g' ./package/base-files/files/bin/config_generate

# 设置密码为空（安装固件时无需密码登陆，然后自己修改想要的密码）
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' ./package/lean/default-settings/files/zzz-default-settings

rm -rf ./package/lean/luci-theme-argon && git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon  #新的argon主题

#wget -P tools/upx/ https://raw.githubusercontent.com/coolsnowwolf/lede/master/tools/upx/Makefile
#wget -P tools/ucl/ https://raw.githubusercontent.com/coolsnowwolf/lede/master/tools/ucl/Makefile

#sed -i '/tools-y += mtools/a\tools-y += ucl upx' tools/Makefile
#sed -i '/builddir dependencies/a\$(curdir)/upx/compile := $(curdir)/ucl/compile' tools/Makefile
