#!/bin/bash

# Find the current directory value
CUR_DIR_PATH=`pwd`
DIR_PATH="${1:-$CUR_DIR_PATH}"

# Making a service config file
cat <<EOF | sudo tee /etc/systemd/system/nodeBackend.service
[Unit]
Description=Node Backend Service
Documentation=https://github.com/IstiyakRiyad/development-server-configuration/blob/main/server/node-service/README.md

[Service]
ExecStartPre=npm install --prefix $DIR_PATH
ExecStartPre=npm run generate --prefix $DIR_PATH
ExecStartPre=npm run dbPush --prefix $DIR_PATH
ExecStartPre=npm run build --prefix $DIR_PATH
ExecStart=npm start --prefix $DIR_PATH
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

# Start the service
sudo systemctl daemon-reload
sudo systemctl enable nodeBackend
sudo systemctl start nodeBackend

# Commands
echo "Node - (typescript with prisma) is initialized at $DIR_PATH"