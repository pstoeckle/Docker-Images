ARG BASE_IMAGE=python
ARG BASE_IMAGE_VERSION=3.9
FROM ${BASE_IMAGE}:${BASE_IMAGE_VERSION}
RUN apt-get update \
    && apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common \
    && (curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -) \
    && apt-key fingerprint 0EBFCD88 \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
    && apt-get update \
    && apt-get install -y docker-ce-cli \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --no-cache-dir --upgrade pip setuptools wheel \
    && pip install --no-cache-dir docker-compose
