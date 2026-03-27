import Config

config :hyper_ui, HyperUIWeb.Endpoint,
  adapter: Bandit.PhoenixAdapter,
  http: [port: 4002],
  secret_key_base: "iaz7aZRz5mHU54ia/T5IhC8dp1j3tknY5EaZ6iuQ6qAq9cf7e7FwGBu/9oib3cbh",
  server: false,
  pubsub_server: HyperUI.PubSub,
  live_view: [signing_salt: "v8L2R8vL"]

config :logger, level: :warning
config :phoenix, :plug_init_mode, :runtime
