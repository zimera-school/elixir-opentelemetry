# Elixir - Phoenix and OpenTelemetry

This repo is an example of instrumented Phoenix RESTful API. The telemetry data is collected by OpenTelemetry Collector and then sent to Jaeger and Zipkin.

## Architecture

The `compose.yaml` is used to create some images and run them for this app. It consists of OpenTelemetry Collector, Jaeger, PostgreSQL, and Zipkin. The `otel-collector-config.yaml` is used as the configurtion for OpenTelemetry collector. 

## Run App

To run this app, first you have to configure and setup:

  * Set credentials for DB in `config/dev.exs` and `compose.yaml`, they should be the same.
  * Run `docker-compose up` (if you want to execute them as background process, put `-d` afer `up`).
  * Get dependencies: `mix deps.get`
  * Setup DB migration: `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Jaeger

Open `localhost:16686`

## Zipkin

Open `localhost:9411`

## End of App

Close `HrService` (the app) first, then:

```
$ docker-compose down
```

