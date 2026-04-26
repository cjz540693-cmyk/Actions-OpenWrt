#!/bin/bash

cd openwrt

echo "===== 写入核心插件（绝不会丢） ====="

cat >> .config <<EOF

# LuCI
CONFIG_PACKAGE_luci=y
CONFIG_PACKAGE_luci-ssl-openssl=y
CONFIG_PACKAGE_luci-compat=y

# 中文
CONFIG_PACKAGE_luci-i18n-base-zh-cn=y

# 主题
CONFIG_PACKAGE_luci-theme-argon=y

# 网络工具
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_wget=y

# 常用工具
CONFIG_PACKAGE_htop=y
CONFIG_PACKAGE_nano=y
CONFIG_PACKAGE_bash=y

# 性能
CONFIG_PACKAGE_irqbalance=y

# Tailscale（如果源码有才会生效）
CONFIG_PACKAGE_tailscale=y
CONFIG_PACKAGE_luci-app-tailscale=y

EOF

echo "===== 自动补依赖（关键步骤） ====="
make defconfig

echo "===== 检查插件是否成功写入 ====="
grep luci .config || echo "❌ LuCI没写进去"
grep tailscale .config || echo "⚠ tailscale可能不存在"
