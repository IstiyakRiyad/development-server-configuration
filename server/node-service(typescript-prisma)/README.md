# Redis & Postgres Configuration:

Here this compose file will create one redis database and one postgres database on the machine. 
All login credentials will be set on the .env file.

## Setting Environment for Setup

Here DIR_PATH is the directory of your node service. You can manually give it or run on the directory.

```bash
DIR_PATH=$(pwd)
```


## Setting Service Configuration file

```bash
cat <<EOF | sudo tee /etc/systemd/system/nodeBackend.service
[Unit]
Description=Node Backend Service
Documentation=https://github.com/IstiyakRiyad/development-server-configuration/blob/main/server/node-service/README.md

[Service]
ExecStartPre=npm install --prefix ${ DIR_PATH }
ExecStartPre=npm run generate --prefix ${ DIR_PATH }
ExecStartPre=npm run dbPush --prefix ${ DIR_PATH }
ExecStartPre=npm run build --prefix ${ DIR_PATH }
ExecStart=npm start --prefix ${ DIR_PATH }
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF
```

## Start the node Server
```bash
{
  sudo systemctl daemon-reload
  sudo systemctl enable nodeBackend
  sudo systemctl start nodeBackend
}
```

