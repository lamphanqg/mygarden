ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION-slim-buster

ARG NODE_MAJOR
ARG BUNDLER_VERSION
ARG YARN_VERSION
SHELL ["/bin/bash", "-c"]

# Common dependencies
RUN apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    curl \
    less \
    git \
    graphviz \
    imagemagick \
    openssh-client \
    python-2.7 \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

# Installing the ttf-takao-mincho package will add support for displaying Japanese text in Ubuntu.
RUN apt-get update -qq \
  && apt install -yq fonts-noto-unhinted fonts-noto-cjk fonts-takao-mincho

# Add NodeJS to sources list
RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR.x | bash -

# Add Yarn to the sources list
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list

# Install dependencies
RUN apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    default-libmysqlclient-dev \
    nodejs \
    yarn=$YARN_VERSION-1 \
    tzdata \
    vim \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

# Configure bundler
ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3 \
  TZ=Asia/Tokyo

# Uncomment this line if you store Bundler settings in the project's root
# ENV BUNDLE_APP_CONFIG=.bundle

# Uncomment this line if you want to run binstubs without prefixing with `bin/` or `bundle exec`
# ENV PATH /mygarden/bin:$PATH

# Upgrade RubyGems and install required Bundler version
RUN echo 'gem: --no-document' > /usr/local/etc/gemrc
RUN gem update --system && \
    gem install bundler:$BUNDLER_VERSION


RUN npm install -g stylelint@13.6.1 eslint@6.8.0

WORKDIR /mygarden

# # Running bundle install
COPY Gemfile Gemfile.lock /mygarden/
RUN bundle install

# # Running yarn install
COPY package.json yarn.lock /mygarden/
RUN yarn install --check-files

# # Create a directory for the app code
RUN mkdir -p /mygarden
