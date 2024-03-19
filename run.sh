#!/bin/bash
echo "---- Set environment values ----"
unamestr=$(uname)

if [ $unamestr = "Linux" ]; then
  export $(grep -v '^#' .env | xargs -d '\n')

elif [ $unamestr = "FreeBSD" ] || [ $unamestr = "Darwin" ]; then
  export $(grep -v '^#' .env | xargs -0)
fi

echo "---- OK ----"
echo "---- $1 ----"

if [ $1 = "DOCKER-COMPOSE" ]; then
  echo "---- Docker compose down ----"
  docker compose down

  echo "---- Docker compose up ----"
  docker compose up -d
fi
