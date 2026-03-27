defmodule HyperUI.Storybook.MixProject do
  use Mix.Project

  def project do
    [
      app: :hyper_ui_storybook,
      version: "0.1.0",
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      listeners: [Phoenix.CodeReloader]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support", "hyper_ui", "hyper_ui_web"]
  defp elixirc_paths(_), do: ["lib", "hyper_ui", "hyper_ui_web"]

  def application do
    [
      extra_applications: [:logger, :runtime_tools],
      mod: {HyperUI.Application, []}
    ]
  end

  defp deps do
    [
      {:hyper_ui, path: ".."},
      {:phoenix_storybook, "~> 0.9.0"},
      {:bandit, "~> 1.5"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:esbuild, "~> 0.8", only: :dev},
      {:tailwind, "~> 0.3", only: :dev},
      {:jason, "~> 1.2"},
      {:floki, ">= 0.30.0", only: :test},
      {:heroicons, "~> 0.5.0"}
    ]
  end

  defp aliases do
    [
      setup: ["deps.get", "assets.setup", "assets.build"],
      "assets.setup": ["tailwind.install --if-missing", "esbuild.install --if-missing"],
      "assets.build": [
        "tailwind default",
        "esbuild default",
        "tailwind storybook",
        "esbuild storybook"
      ],
      "assets.deploy": [
        "tailwind default --minify",
        "esbuild default --minify",
        "tailwind storybook --minify",
        "esbuild storybook --minify",
        "phx.digest"
      ]
    ]
  end
end
