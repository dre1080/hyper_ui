import Config

config :hyper_ui_storybook, HyperUIWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  secret_key_base: "iaz7aZRz5mHU54ia/T5IhC8dp1j3tknY5EaZ6iuQ6qAq9cf7e7FwGBu/9oib3cbh",
  render_errors: [
    formats: [html: HyperUIWeb.ErrorHTML],
    layout: false
  ],
  pubsub_server: HyperUI.PubSub,
  live_view: [signing_salt: "v8L2R8vL"],
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:default, ~w(--watch)]},
    tailwind: {Tailwind, :install_and_run, [:default, ~w(--watch)]},
    storybook_esbuild: {Esbuild, :install_and_run, [:storybook, ~w(--watch)]},
    storybook_tailwind: {Tailwind, :install_and_run, [:storybook, ~w(--watch)]}
  ]

config :esbuild,
  version: "0.27.3",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2022 --outdir=../priv/static/assets/js --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ],
  storybook: [
    args:
      ~w(js/storybook.js --bundle --target=es2022 --outdir=../priv/static/assets/js --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :tailwind,
  version: "4.2.1",
  default: [
    args: ~w(
      --input=css/app.css
      --output=../priv/static/assets/css/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ],
  storybook: [
    args: ~w(
      --input=css/storybook.css
      --output=../priv/static/assets/css/storybook.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

config :hyper_ui_storybook, HyperUIWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"../../lib/hyper_ui/components/.*(ex)$",
      ~r"hyper_ui/backend.ex$",
      ~r"storybook/.*(_root.index.exs|welcome.story.exs)$",
      ~r"storybook/components/.*(story.exs)$"
    ]
  ]

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20
config :phoenix, :plug_init_mode, :runtime
