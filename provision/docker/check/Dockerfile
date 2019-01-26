FROM python:3.6.4

MAINTAINER Luis Mayta <@slovacus>

ARG stage
ARG version
LABEL NAME zsh-docker-aliases-check-$stage

COPY ./requirements/ /usr/src/requirements/
COPY ./requirements.txt /usr/src/requirements.txt

# set working directory to /usr/src/
WORKDIR /usr/src/

RUN apt-get update \
  && apt-get -y install --no-install-recommends \
  # tools validation
  git-core \
  shellcheck \
  # install python dependencies
  && pip install -r /usr/src/requirements/quality.txt \
  && apt-get purge \
  && apt-get autoremove  \
  && rm -rf /var/lib/apt/lists/*
