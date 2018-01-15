# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cp,
  ecto_repos: [Cp.Repo]

# Configures the endpoint
config :cp, CpWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "m36WqX4PO805UiHOOwYCD4v2FpiabYr7ypb7VmY0o2zPfuSGMAiOtg9X+Pv21Dvj",
  render_errors: [view: CpWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

#Configure InfluxDB
config :cp, Cp.Influx,
       database:  "cp_dev",
       host:      "localhost",
       http_opts: [ insecure: true],
       pool:      [ max_overflow: 0, size: 1 ],
       port:      8086,
       scheme:    "http",
       writer:    Instream.Writer.Line

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
