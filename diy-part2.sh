#!/bin/bash

# ===== 默认IP（简单稳定写法）=====
sed -i 's/192.168.1.1/192.168.110.1/g' package/base-files/files/bin/config_generate


# ===== 默认主题 + 中文 =====
mkdir -p package/base-files/files/etc/uci-defaults

cat > package/base-files/files/etc/uci-defaults/30-luci << 'EOF'
#!/bin/sh
uci set luci.main.lang='zh_cn'
uci set luci.main.mediaurlbase='/luci-static/argon'
uci commit luci
exit 0
EOF


# ===== 开机启动 Tailscale =====
cat > package/base-files/files/etc/uci-defaults/90-tailscale << 'EOF'
#!/bin/sh
/etc/init.d/tailscale enable
/etc/init.d/tailscale start
exit 0
EOF


# ===== 给执行权限 =====
chmod +x package/base-files/files/etc/uci-defaults/*
