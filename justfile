build tag:
    #!/usr/bin/env bash
    docker buildx build \
      --push \
      --platform linux/arm64/v8,linux/amd64 \
      --tag 918821718107.dkr.ecr.eu-west-1.amazonaws.com/docker-minecraft-backup:{{tag}} \
      .

login:
    aws ecr get-login-password --region eu-west-1 --profile alisonRW-script | docker login --username AWS --password-stdin 918821718107.dkr.ecr.eu-west-1.amazonaws.com

alias b := build
alias l := login
