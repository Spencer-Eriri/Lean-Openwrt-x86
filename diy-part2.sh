#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

#将原版 Argon 主题及其管理程序删除
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-argon-config

#将上述删除的程序替换为 jerrykuku 版（18.06 分支）
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/downloads/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-app-argon-config.git package/downloads/luci-app-argon-config

#应用默认主题为 Argon-18.06
#方式是取消 Bootstrap 在 Openwrt 中的依赖地位，取而代之的是 Argon-18.06
#但 Bootstrap 和 Argon-18.06 均会编译，在 config 中去除 Bootstrap 是无效的
sed -i 's/luci-theme-bootstrap/luci-theme-argon/' feeds/luci/collections/luci/Makefile
