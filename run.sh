#!/bin/bash

# 서버 내 .env 파일로 부터 환경변수 정의
echo "---- set environment values ----"
unamestr=$(uname)

if [ $unamestr = "Linux" ]; then
  export $(grep -v '^#' .env | xargs -d '\n')

elif [ $unamestr = "FreeBSD" ] || [ $unamestr = "Darwin" ]; then
  export $(grep -v '^#' .env | xargs -0)
fi

echo "---- OK ----"
echo "---- $1 ----"

if [ $1 = "DOCKER-COMPOSE" ]; then
  # 기존 서비스 종료
  echo "---- docker compose down ----"
  docker compose down

  # 서비스 시작 (쉘 파일 내에서 export를 수행하기 때문에 환경변수가 적용됨)
  echo "---- docker compose up ----"
  docker compose up -d
fi
