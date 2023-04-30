defmodule HrService.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    :opentelemetry_cowboy.setup()
    OpentelemetryPhoenix.setup(adapter: :cowboy2)
    OpentelemetryEcto.setup([:demo, :repo])

    children = [
      # Start the Telemetry supervisor
      HrServiceWeb.Telemetry,
      # Start the Ecto repository
      HrService.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: HrService.PubSub},
      # Start Finch
      {Finch, name: HrService.Finch},
      # Start the Endpoint (http/https)
      HrServiceWeb.Endpoint
      # Start a worker by calling: HrService.Worker.start_link(arg)
      # {HrService.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HrService.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HrServiceWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
