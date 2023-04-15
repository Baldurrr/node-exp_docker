#!/bin/bash
cd /home/container

# Get latest release of node exporter
BINARY_URL="$(curl -s https://api.github.com/repos/prometheus/node_exporter/releases/latest | jq -r '.assets[] | select(.name|match("linux-amd64.tar.gz$")) | .browser_download_url')"
echo "Binary download URL: ${BINARY_URL}"
wget ${BINARY_URL}
tar -xvf *.linux-amd64.tar.gz --strip-components=1
rm *.tar.gz
ls -la

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}
