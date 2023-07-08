# Redis & Postgres Configuration:

Here this compose file will create one redis database and one postgres database on the machine. 
All login credentials will be set on the .env file.

## Docker Compose file
```yaml
services:
  postgres:
    container_name: postgres-server
    image: postgres:latest
    ports:
      - 5432:5432
    environment:
      POSTGRES_USER: ${POSTGRES_USER}
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
    restart: always
    volumes:
      - postgresData:/var/lib/postgresql/data
      
  redis:
    container_name: redis-stack-server
    image: redis/redis-stack-server:latest
    ports:
      - 6379:6379
    restart: always
    volumes:
      - redisDataStack:/data


volumes:
  redisDataStack: {}
  postgresData: {}

```

## .env file
```bash
# Postgres database config
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres

# Redis database config
REDIS_USER=default
REDIS_PASSWORD=example
```

