#!/bin/bash

mkdir -p package/base-files/files/etc/uci-defaults

# 默认IP
cat > package/base-files/files/etc/uci-defaults/99-ip << 'EOF'
#!/bin/sh
uci set network.lan.ipaddr='192.168.110.1'
uci commit network
exit 0
EOF

# 默认主题
cat > package/base-files/files/etc/uci-defaults/30-theme << 'EOF'
#!/bin/sh
uci set luci.main.mediaurlbase='/luci-static/argon'
uci commit luci
exit 0
EOF

chmod +x package/base-files/files/etc/uci-defaults/*
