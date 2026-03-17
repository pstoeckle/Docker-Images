FROM node:24.14.0-trixie@sha256:65f9f110306c2502c8417606814c3dc75f7de386506017fa083da21c08dc5ced

# renovate: datasource=ruby-version depName=ruby
ENV RUBY_VERSION=4.0.1

# renovate: datasource=deb depName=git-lfs
ENV GIT_LFS_VERSION=3.6.1-1+b5

# renovate: datasource=deb depName=rbenv
ENV RBENV_VERSION=1.1.2-2

# renovate: datasource=npm depName=npm
ENV NPM_VERSION=11.11.1

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
    --depth 1 \
    --quiet \
    https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build ; \
    # install newest ruby
    rbenv install "${RUBY_VERSION}" ; \
    rbenv global "${RUBY_VERSION}" ; \
    # Install bundler
    gem install bundler
