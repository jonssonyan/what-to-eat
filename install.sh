#!/usr/bin/env bash
# What to eat Installation Script
# Author: jonssonyan <https://jonssonyan.com>
# Github: https://github.com/jonssonyan/what-to-eat

set -e

init_var() {
  ECHO_TYPE="echo -e"

  APP_DATA="/dockerdata/what-to-eat"
  APP_LOG="${APP_DATA}/logs"

  image_name="jonssonyan/what-to-eat:0.1.0"
  container_name="jy-what-to-eat"

  PORT=3002
  DATABASE_URL=""
  NEXTAUTH_URL=""
  NEXTAUTH_SECRET=""
  GOOGLE_CLIENT_ID=""
  GOOGLE_CLIENT_SECRET=""
}

echo_content() {
  local color_code
  case $1 in
  "red") color_code="\033[31m" ;;
  "green") color_code="\033[32m" ;;
  "yellow") color_code="\033[33m" ;;
  "blue") color_code="\033[34m" ;;
  "purple") color_code="\033[35m" ;;
  "skyBlue") color_code="\033[36m" ;;
  "white") color_code="\033[37m" ;;
  *) color_code="\033[0m" ;;
  esac
  ${ECHO_TYPE} "${color_code}$2\033[0m"
}

check_docker() {
  if ! command -v docker &>/dev/null; then
    echo_content red "Docker is not installed. Please install Docker first."
    exit 1
  fi
}

create_dirs() {
  mkdir -p ${APP_DATA}
  mkdir -p ${APP_LOG}
  chown 1001:1001 ${APP_LOG}
}

pull_repo() {
  echo_content skyBlue "---> Pulling latest changes"
  git pull
  if [[ $? -ne 0 ]]; then
    echo_content red "Git pull failed. Trying to re-clone repository..."
    exit 1
  fi
}

read_env_config() {
  while true; do
    read -r -p "Please input your DATABASE_URL (Required): " input
    if [[ -n "$input" ]]; then
      DATABASE_URL="$input"
      break
    else
      echo_content red "DATABASE_URL cannot be empty."
    fi
  done

  while true; do
    read -r -p "Please input your NEXTAUTH_URL (Required): " input
    if [[ -n "$input" ]]; then
      NEXTAUTH_URL="$input"
      break
    else
      echo_content red "NEXTAUTH_URL cannot be empty."
    fi
  done

  while true; do
    read -r -p "Please input your NEXTAUTH_SECRET (Required): " input
    if [[ -n "$input" ]]; then
      NEXTAUTH_SECRET="$input"
      break
    else
      echo_content red "NEXTAUTH_SECRET cannot be empty."
    fi
  done

  while true; do
    read -r -p "Please input your GOOGLE_CLIENT_ID (Required): " input
    if [[ -n "$input" ]]; then
      GOOGLE_CLIENT_ID="$input"
      break
    else
      echo_content red "GOOGLE_CLIENT_ID cannot be empty."
    fi
  done

  while true; do
    read -r -p "Please input your GOOGLE_CLIENT_SECRET (Required): " input
    if [[ -n "$input" ]]; then
      GOOGLE_CLIENT_SECRET="$input"
      break
    else
      echo_content red "GOOGLE_CLIENT_SECRET cannot be empty."
    fi
  done

  read -r -p "Please input your service PORT (default: $PORT): " input
  [[ -n "$input" ]] && PORT="$input"

  echo_content yellow "PORT: $PORT"
}

build_image() {
  echo_content skyBlue "---> Building Docker image: $image_name"
  docker build -t "$image_name" .
  if [[ $? -eq 0 ]]; then
    echo_content skyBlue "Image built successfully"
  else
    echo_content red "Image build failed"
    exit 1
  fi
}

run_container() {
  if docker ps -a --format '{{.Names}}' | grep -q "^${container_name}$"; then
    echo_content yellow "Container '${container_name}' already exists. Removing..."
    docker rm -f "$container_name"
  fi

  echo_content skyBlue "---> Starting container: $container_name"

  docker run -d --name "$container_name" --restart always \
    --network=host \
    -e PORT="$PORT" \
    -e DATABASE_URL="$DATABASE_URL" \
    -e NEXTAUTH_URL="$NEXTAUTH_URL" \
    -e NEXTAUTH_SECRET="$NEXTAUTH_SECRET" \
    -e GOOGLE_CLIENT_ID="$GOOGLE_CLIENT_ID" \
    -e GOOGLE_CLIENT_SECRET="$GOOGLE_CLIENT_SECRET" \
    -v ${APP_LOG}:/app/logs \
    "$image_name"

  if [[ $? -eq 0 ]]; then
    echo_content skyBlue "Container is running."
  else
    echo_content red "Failed to start the container."
    exit 1
  fi
}

main() {
  cd "$(dirname "$0")" || exit 1

  init_var

  check_docker

  create_dirs

  pull_repo

  read_env_config

  build_image

  run_container
}

main "$@"
