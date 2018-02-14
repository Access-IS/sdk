#!/usr/bin/env bash



cp -a output/host output/sdk

cat > output/sdk/env.sh <<EOF
export SYSROOT=\$HOME/sdk/arm-buildroot-linux-gnueabihf/sysroot
export PATH=\$HOME/sdk/bin:$PATH
export HOST=arm-buildroot-linux-
EOF

cat .config | gzip -9 > output/sdk/.BRconfig.gz
sdk_version=`git rev-parse --short HEAD`
tar -czf output/images/sdk-$sdk_version.tar.gz -C output/ sdk
echo "created sdk : output/images/sdk-$sdk_version.tar.gz"
rm -rf output/sdk
exit 0
