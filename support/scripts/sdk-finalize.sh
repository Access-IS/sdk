#!/usr/bin/env bash



#cp -a output/host output/sdk

cat > /opt/sdk/env.sh <<EOF
export SYSROOT=/opt/sdk/arm-ais-linux-gnueabihf/sysroot
export PATH=/opt/sdk/bin:\$PATH
export HOST=arm-ais-linux-
EOF

cat .config | gzip -9 > /opt/sdk/.BRconfig.gz
sdk_version=`git rev-parse --short HEAD`
tar -czf output/images/sdk-$sdk_version.tar.gz -C /opt/ sdk
echo "created sdk : output/images/sdk-$sdk_version.tar.gz"
#rm -rf output/sdk
exit 0
