## Migrating postgresql database

### Take a dump of your database:
```bash
pg_dump -Fc -v -h <database_link> -U <username> -d <db_name> -p <port> > dump_file.dump
```

### Push dump to another database
```bash
pg_restore -c -h <database_link> -U <username> -d <db_name> -p <port> -v dump_file.dump
```

### Port forwarding my database to my local machine
```bash
ssh -N -L localhost:<port>:<addr-from-remote-machine>:5432 <remote-user>@<remote-address>
```
