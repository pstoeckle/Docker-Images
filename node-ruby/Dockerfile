FROM node:24.14.1-trixie@sha256:dcc3e56b82427ddc3b91ca2b18499450d670fc58251d944e5107d8ef2899f841

# renovate: datasource=ruby-version depName=ruby
ENV RUBY_VERSION=4.0.2

# renovate: datasource=deb depName=git-lfs
ENV GIT_LFS_VERSION=3.6.1-1+b5

# renovate: datasource=deb depName=rbenv
ENV RBENV_VERSION=1.1.2-2

# renovate: datasource=npm depName=npm
ENV NPM_VERSION=11.12.1

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
