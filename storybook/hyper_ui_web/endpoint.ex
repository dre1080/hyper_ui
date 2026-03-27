defmodule HyperUIWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :hyper_ui_storybook

  @session_options [
    store: :cookie,
    key: "_hyper_ui_key",
    signing_salt: "v8L2R8vL"
  ]

  socket "/live", Phoenix.LiveView.Socket, websocket: [connect_info: [session: @session_options]]

  plug Plug.Static,
    at: "/",
    from: :hyper_ui_storybook,
    gzip: false,
    only: ~w(assets favicon.ico robots.txt)

  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug HyperUIWeb.Router
end
