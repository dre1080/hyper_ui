defmodule HyperUI.Storybook do
  use PhoenixStorybook,
    otp_app: :hyper_ui,
    title: "HyperUI",
    content_path: Path.expand("../storybook", __DIR__),
    js_path: "/assets/js/storybook.js",
    css_path: "/assets/css/storybook.css",
    favicon_path: "/favicon.ico",
    sandbox_class: "hyper-ui"
end
