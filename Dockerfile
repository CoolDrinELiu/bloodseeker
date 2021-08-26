FROM ruby:2.6.3-alpine

ENV BUNDLER_VERSION=2.2.6

# RUN apk add --update --no-cache \
#       binutils-gold \
#       build-base \
#       curl \
#       file \
#       g++ \
#       gcc \
#       git \
#       less \
#       libstdc++ \
#       libffi-dev \
#       libc-dev \
#       linux-headers \
#       libxml2-dev \
#       libxslt-dev \
#       libgcrypt-dev \
#       make \
#       netcat-openbsd \
#       nodejs \
#       openssl \
#       pkgconfig \
#       postgresql-dev \
#       python \
#       tzdata \
#       yarn
RUN apk --no-cache add postgresql-client \
  vim \
  yarn \
  wget \
  gcc \
  autoconf \
  libc-dev \
  linux-headers \
  make \
  libxml2-dev \
  libressl-dev \
  postgresql-dev \
  libffi-dev \
  readline-dev \
  yaml-dev \
  tzdata \
  git \
  nodejs \
  less \
  curl \
  g++ \
  ca-certificates \
  imagemagick \
  build-base \
  ruby-dev \
  libxslt-dev \
  libcurl

RUN gem install bundler -v 2.2.6

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install

COPY package.json yarn.lock ./

RUN yarn install --check-files

COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
