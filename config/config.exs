# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :queue_challenge,
  ecto_repos: [QueueChallenge.Repo]

# Configures the endpoint
config :queue_challenge, QueueChallengeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "RPhMF2XlqSOrpCTePk9CfdY+mf7kqWTxwa3W/1pVTW1zSG1Jh53glLRyhaHbCuIb",
  render_errors: [view: QueueChallengeWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: QueueChallenge.PubSub,
  live_view: [signing_salt: "mjzVsapT"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
