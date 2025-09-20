FROM node:24.8.0-trixie@sha256:f5162797de1d39d296791046ee253dc9c2f20c000f312aeb289c5e699f56c229

RUN set -eux ; \
    apt-get update -qq ; \
    apt-get install -qq --no-install-recommends -y \
    git-lfs=3.6.1-1+b5 \
    ruby-bundler=2.6.7-2 \
    ruby-dev=1:3.3+b1 \
    ruby=1:3.3+b1 \
    ; \
    apt-get autoremove -y -qq ; \
    apt-get clean ; \
    rm -rf /var/lib/apt/lists/* ; \
    npm install -g \
    npm@11.6.0 \
    ;
