## Migrating postgresql database

### Take a dump of your database:
```bash
pg_dump -Fc -v -h <database_link> -U <username> -d <db_name> -p <port> > dump_file.dump
```

### Push dump to another database
```bash
pg_restore -c -h <database_link> -U <username> -d <db_name> -p <port> -v dump_file.dump
```
