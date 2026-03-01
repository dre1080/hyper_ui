import Config

config :hyper_ui, HyperUIWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  secret_key_base: "iaz7aZRz5mHU54ia/T5IhC8dp1j3tknY5EaZ6iuQ6qAq9cf7e7FwGBu/9oib3cbh",
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

config :hyper_ui, HyperUIWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"lib/hyper_ui/components/.*(ex)$",
      ~r"storybook/.*(exs)$"
    ]
  ]

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20
config :phoenix, :plug_init_mode, :runtime
