FROM haskell:9.6-slim

RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

 RUN cabal update

 RUN cabal install --lib scotty aeson


EXPOSE 3000

CMD ["cabal", "run", "API"]