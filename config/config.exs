# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :quero_alugar,
  ecto_repos: [QueroAlugar.Repo]

# Configures the endpoint
config :quero_alugar, QueroAlugarWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "i6Fez0j6Ky8kLJkdnai8xyH11a0Kyg2BcI9x85c6R182b/amkp34jUxI1kTtq6vB",
  render_errors: [view: QueroAlugarWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: QueroAlugar.PubSub,
  live_view: [signing_salt: "EGrmbT6U"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
