import Config

config :hyper_ui,
  namespace: HyperUI

config :hyper_ui, HyperUIWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: HyperUIWeb.ErrorHTML],
    layout: false
  ],
  pubsub_server: HyperUI.PubSub,
  live_view: [signing_salt: "v8L2R8vL"]

import_config "#{config_env()}.exs"
