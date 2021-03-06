# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :repeatnotes,
  ecto_repos: [RepeatNotes.Repo]

# Configures the endpoint
config :repeatnotes, RepeatNotesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Q0SSISGmbqxfkqsDeKQXw6pLaG7BWKAV2ckS4Bkh55UHv0dSsOpJt4ggO8xASw2W",
  render_errors: [view: RepeatNotesWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: RepeatNotes.PubSub,
  live_view: [signing_salt: "Adb2mONG"]

config :repeatnotes, :pow,
  user: RepeatNotes.Users.User,
  repo: RepeatNotes.Repo,
  cache_store_backend: Pow.Postgres.Store

config :pow, Pow.Postgres.Store, repo: RepeatNotes.Repo

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
