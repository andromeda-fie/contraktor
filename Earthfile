VERSION 0.7

deps:
  ARG ELIXIR=1.16.0
  ARG OTP=26.2.1
  FROM hexpm/elixir:${ELIXIR}-erlang-${OTP}-alpine-3.18.4
  WORKDIR /src
  ENV MIX_ENV=test
  COPY mix.exs mix.lock ./
  RUN mix local.rebar --force
  RUN mix local.hex --force
  RUN mix deps.get
  SAVE ARTIFACT /src/deps AS LOCAL deps

build:
  FROM +deps
  RUN mix deps.compile
  COPY --dir config ./
  COPY --dir lib ./
  RUN mix compile
  SAVE ARTIFACT /src/_build AS LOCAL build

ci:
  FROM +build
  COPY .formatter.exs .
  RUN mix clean
  RUN mix compile --warning-as-errors
  RUN mix format --check-formatted

test:
  FROM +build
  RUN apk add postgresql-contrib
  COPY docker-compose.yml ./
  COPY --dir test ./
  COPY --dir scripts ./

  WITH DOCKER --compose docker-compose.yml
    RUN ./scripts/run_ci_tests
  END

release:
  FROM +test
  COPY rel rel
  RUN MIX_ENV=prod mix do compile, release
  SAVE ARTIFACT /src/_build/prod/rel/contraktor AS LOCAL release

docker-prod:
  FROM alpine:3.18.4
  RUN apk add libstdc++6 openssl ncurses-libs
  WORKDIR /app
  RUN chown nobody /app
  USER nobody
  COPY --dir +release/contraktor .
  CMD ["./contraktor/bin/server"]
  ARG GITHUB_REPO="andromeda-fie/contraktor"
  SAVE IMAGE --push ghcr.io/$GITHUB_REPO:prod

docker-dev:
  FROM +build
  ENV MIX_ENV=dev
  RUN mix deps.compile
  RUN mix compile
  CMD ["iex", "-S", "mix phx.server"]
  ARG GITHUB_REPO="andromeda-fie/contraktor"
  SAVE IMAGE --push ghcr.io/$GITHUB_REPO:dev

docker:
  BUILD +docker-dev
  BUILD +docker-prod
