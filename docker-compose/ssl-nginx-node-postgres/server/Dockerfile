FROM node:latest

WORKDIR /usr/app


# Create the keys
COPY genKeyPair.js ./
COPY secretKeys secretKeys
RUN cat genKeyPair.js | node --input-type=module

# Install Dependences
COPY package*.json ./
RUN npm ci

# Setup database client
RUN npm run generate

# Copy all files
COPY . .

CMD npm run dbPush && \
    npm run start

EXPOSE 5000

