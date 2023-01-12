ARG BASE_IMAGE=python
ARG BASE_IMAGE_VERSION=3.9
FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}
RUN apt-get update -qq\
    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common \
    && (curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -) \
    && apt-key fingerprint 0EBFCD88 \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
    && apt-get update -qq \
    && apt-get install -qqy docker-ce-cli docker-compose-plugin \
    && rm -rf /var/lib/apt/lists/*
