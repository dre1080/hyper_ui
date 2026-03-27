defmodule HyperUIWeb.Router do
  use Phoenix.Router
  import Phoenix.LiveView.Router
  import PhoenixStorybook.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {HyperUIWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/" do
    storybook_assets()
  end

  scope "/" do
    pipe_through :browser
    live_storybook "/", backend_module: HyperUI.Storybook
  end
end
