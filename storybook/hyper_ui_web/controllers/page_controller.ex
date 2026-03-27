defmodule HyperUIWeb.PageController do
  use Phoenix.Controller, otp_app: :hyper_ui, formats: [:html]

  def index(conn, _params) do
    text(conn, "HyperUI Component Library - Visit /storybook for the interactive components.")
  end
end
