# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :menucard, Menucard.Guardian,
  issuer: "menucard",
  secret_key: "504ye6h6Mg6etxDEaVDkwYNy1yL67vztxHGBls6aQa05boBlkjKLYDrfTVEmEYf6"

config :menucard,
  ecto_repos: [Menucard.Repo]

# Configures the endpoint
config :menucard, MenucardWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2IeEprXl0aRSspWu6CkoUaBPnuSuizUXkzK9fxJVwjCBtmhbJFEn+Nk9R84l0m9m",
  render_errors: [view: MenucardWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Menucard.PubSub,
  live_view: [signing_salt: "BwETt0Kc"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
