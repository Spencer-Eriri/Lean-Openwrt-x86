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


#加入 jerrykuku 仓库后下面这些不需要了
#将原版 Argon 删除，替换为 jerrykuku 版（18.06 分支）
#rm -rf ~/lede/feeds/luci/themes/luci-theme-argon
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git ~/lede/feeds/luci/themes/luci-theme-argon

#应用默认主题为 Argon-18.06 （jerrykuku 的版本，和 lean 自带的 Argon 报名不同，不冲突，编译后在 GUI 中显示名字仍为 Argon）
#方式是取消 Bootstrap 在 Openwrt 中的依赖地位，取而代之的是 Argon-18.06
#但 Bootstrap 和 Argon-18.06 均会编译，在 config 中去除 Bootstrap 是无效的
sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/' ~/lede/feeds/luci/collections/luci/Makefile


#添加软件
#添加jerrykuku的argon主题和配置文件
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/jerryk/argon-18.06
git clone -b 18.06 https://github.com/jerrykuku/luci-app-argon-config.git package/jerryk/argon-config-18.06

