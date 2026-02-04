FROM node:24.13.0-trixie@sha256:c5d7e2590675fc31c7d6709e052030f9be090bc8ddcded1b559c503c54cf5c2b

# renovate: datasource=ruby-version depName=ruby
ENV RUBY_VERSION=4.0.1

# renovate: datasource=github-releases depName=rbenv/ruby-build packageName=rbenv/ruby-build
ENV RUBY_BUILD_VERSION=20251225

# renovate: datasource=deb depName=git-lfs
ENV GIT_LFS_VERSION=3.6.1-1+b5

# renovate: datasource=deb depName=rbenv
ENV RBENV_VERSION=1.1.2-2

# renovate: datasource=npm depName=npm
ENV NPM_VERSION=11.9.0

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
