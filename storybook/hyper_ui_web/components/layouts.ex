defmodule HyperUIWeb.Layouts do
  use Phoenix.Component
  import Phoenix.Controller, only: [get_csrf_token: 0]

  def root(assigns) do
    ~H"""
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="csrf-token" content={get_csrf_token()} />
        <link rel="icon" type="image/x-icon" href="/favicon.ico">
        <title>HyperUI</title>
        <link phx-track-static rel="stylesheet" href="/assets/css/app.css" />
        <script defer phx-track-static type="text/javascript" src="/assets/js/app.js"></script>
      </head>
      <body class="bg-white hyper-ui">
        <%= @inner_content %>
      </body>
    </html>
    """
  end
end
