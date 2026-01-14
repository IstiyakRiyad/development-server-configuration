## Move dotenv to bash environment variable
. ./.env

## Check if already secret generated
if [ -z "$SENTRY_SECRET_KEY" ]; then
    ## Generate secret key
    SECRET=$(docker run --rm sentry sentry config generate-secret-key)

    ## Save secret to .env file
    ESCAPED_SECRET=$(printf '%s\n' "$SECRET" | sed 's/[\/&]/\\&/g')
    sed -i "s/SENTRY_SECRET_KEY=\".*/SENTRY_SECRET_KEY=\"$ESCAPED_SECRET\"/" .env

    . ./.env
    echo "Secret: $SECRET"

    echo "initializing sentry database"
    docker compose run --rm sentry-web sentry upgrade

else
    echo 'If you want to reset, clear all data docker data and make SENTRY_SECRET_KEY="" in .env'
fi

echo "starting sentry"
docker compose up -d
