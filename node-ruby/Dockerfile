FROM node:24.12.0-trixie@sha256:9fabb41bc32c72b02fd332bb6b6a17e01117d7eaa379a497a5adf7e1651baa2b

# renovate: datasource=ruby-version depName=ruby
ENV RUBY_VERSION=3.4.8

# renovate: datasource=github-releases depName=rbenv/ruby-build packageName=rbenv/ruby-build
ENV RUBY_BUILD_VERSION=20251217

# renovate: datasource=deb depName=git-lfs
ENV GIT_LFS_VERSION=3.6.1-1+b5

# renovate: datasource=deb depName=rbenv
ENV RBENV_VERSION=1.1.2-2

# renovate: datasource=npm depName=npm
ENV NPM_VERSION=11.7.0

ENV PATH="/root/.rbenv/versions/${RUBY_VERSION}/bin/:${PATH}"

RUN set -eux ; \
    apt-get update -qq ; \
    apt-get install -qqy --no-install-recommends \
    "git-lfs=${GIT_LFS_VERSION}" \
    "rbenv=${RBENV_VERSION}" \
    ; \
    apt-get autoremove -qqy ; \
    apt-get clean ; \
    rm -rf /var/lib/apt/lists/* ; \
    # Install NPM
    npm install -g \
    "npm@${NPM_VERSION}" \
    ; \
    # Install ruby-build with rbenv install
    git clone \
    --branch "v${RUBY_BUILD_VERSION}" \
    --depth 1 \
    --quiet \
    https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build ; \
    # install newest ruby
    rbenv install "${RUBY_VERSION}" ; \
    rbenv global "${RUBY_VERSION}" ; \
    # Install bundler
    gem install bundler
