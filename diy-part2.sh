#!/bin/bash

# 设置默认IP
mkdir -p package/base-files/files/etc/uci-defaults

cat > package/base-files/files/etc/uci-defaults/99-ip << 'EOF'
#!/bin/sh
uci set network.lan.ipaddr='192.168.110.1'
uci commit network
exit 0
EOF

# 设置默认主题（argon）
cat > package/base-files/files/etc/uci-defaults/30-theme << 'EOF'
#!/bin/sh
uci set luci.main.mediaurlbase='/luci-static/argon'
uci commit luci
exit 0
EOF

chmod +x package/base-files/files/etc/uci-defaults/*
