FROM node:19.1.0

LABEL author="Patrick Stöckle <patrick.stoeckle@posteo.de>"

RUN apt-get update -qq \
    && apt-get install -qq --no-install-recommends -y ruby=1:2.7+2 ruby-bundler=2.2.5-2 ruby-dev=1:2.7+2 \
    && apt-get autoremove -y -qq \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && npm install -g npm@9.1.2
