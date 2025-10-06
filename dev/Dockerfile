FROM docker.io/library/debian:stable-slim

RUN apt update \
    && apt upgrade -y \
    && apt install -y \
      curl git ruby ruby-dev build-essential openssh-client procps vim \
    && mkdir -p -m 0700 ~/.ssh \
    && ssh-keyscan github.com >> ~/.ssh/known_hosts

RUN useradd linuxbrew -m
WORKDIR /home/linuxbrew
USER linuxbrew

ARG GITHUB_USER_NAME
ARG GITHUB_USER_EMAIL

RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
RUN git config --global user.name "$GITHUB_USER_NAME" \
    && git config --global user.email "$GITHUB_USER_EMAIL"

RUN eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" \
    && brew tap --force homebrew/core

RUN eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" \
    && brew install tmck-code/taps/pokesay

WORKDIR /home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/tmck-code/homebrew-taps
