# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_app,
  ecto_repos: [PhoenixApp.Repo]

# Configures the endpoint
config :phoenix_app, PhoenixAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nCMtm/AGvzvgQE+TnsRsSXsA2MCeJwalIZi1pe9fPXg6eS7mK2dBZkgM7FMxLCFl",
  render_errors: [view: PhoenixAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

defmodule Rails.Helpers do
  def stage(:dev),  do: "development"
  def stage(:prod), do: "production"
  def stage(other), do: other
end

config :exq,
  name: Exq,
  url: System.get_env("REDIS_URL") || "redis://127.0.0.1:6379",
  namespace: "rms-#{Rails.Helpers.stage(Mix.env)}",
  concurrency: :infinite,
  queues: ["default"],
  poll_timeout: 50,
  scheduler_poll_timeout: 200,
  scheduler_enable: true,
  max_retries: 25,
  shutdown_timeout: 5000

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
