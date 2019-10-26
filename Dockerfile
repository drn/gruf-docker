ARG RUBY_VERSION=2.5.1

FROM ruby:${RUBY_VERSION}-slim as base

FROM base as build

WORKDIR /tmp

RUN apt-get -qq update \
  && apt-get install -yqq --no-install-recommends \
    build-essential \
    liblzma-dev \
    libpq-dev \
    patch \
    ruby-dev \
    zlib1g-dev \
    git \
  && apt-get -yqq clean \
  && rm -rf /var/lib/apt/lists/*

COPY Gemfile* ./

RUN bundle config --global frozen 1 && bundle install -j4 --retry 3

FROM base as dev

ENV APP_HOME /srv/thanx-ordering

RUN apt-get -qq update \
  && apt-get install -yqq --no-install-recommends \
    bash \
    libpq-dev \
    curl \
  && apt-get -yqq clean \
  && rm -rf /var/lib/apt/lists/*

RUN addgroup --geco 1000 --system app && adduser -u 1000 --system -group app

WORKDIR $APP_HOME

COPY --from=build /usr/local/bundle/ /usr/local/bundle/
COPY --chown=app:app . .

EXPOSE 50051

FROM dev

USER app

ENV GRPC_VERBOSITY debug

CMD ["bundle", "exec", "gruf"]
