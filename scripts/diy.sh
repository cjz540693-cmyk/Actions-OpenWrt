#!/bin/bash

# 改IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate || true

# 中文
sed -i 's/option lang .*/option lang zh_cn/' package/base-files/files/etc/config/luci || true

# tailscale开机
cat >> package/base-files/files/etc/rc.local <<EOF

tailscaled &
sleep 3
tailscale up --accept-routes &

EOF
