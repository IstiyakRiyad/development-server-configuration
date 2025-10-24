# Essential Commands for elastic search

## Setup Max Map Count on Host machine
write this `vm.max_map_count=262144` in `/etc/sysctl.conf` file.  then run `sudo sysctl -p`
```bash
sudo sysctl -w vm.max_map_count=262144
```

## Command after starting container
### Reset the password of elastic search
```bash
docker exec -it elastic /usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic -b
```

### Generate token(enrollment token) for kibana
```bash
docker exec -it elastic /usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana
```

### Generate kibana code
```bash
docker exec -it kibana bin/kibana-verification-code
```

### Copy http cert from elastic db
```bash
docker cp elastic:/usr/share/elasticsearch/config/certs/http_ca.crt .
```

