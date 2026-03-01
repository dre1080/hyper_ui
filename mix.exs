defmodule HyperUI.MixProject do
  use Mix.Project

  @version "0.1.0"
  @source_url "https://github.com/dre1080/hyper_ui"

  def project do
    [
      app: :hyper_ui,
      version: @version,
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      docs: docs(),
      name: "HyperUI",
      source_url: @source_url,
      aliases: aliases(),
      listeners: [Phoenix.CodeReloader]
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

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(:dev), do: ["lib", "storybook"]
  defp elixirc_paths(_), do: ["lib"]

  def application do
    [
      extra_applications: [:logger],
      mod: if(Mix.env() == :dev, do: {HyperUI.Application, []}, else: [])
    ]
  end

  defp deps do
    [
      {:phoenix_live_view, "~> 1.0.0-rc or ~> 1.0"},
      {:phoenix_storybook, "~> 0.8", only: [:dev, :test]},
      {:heroicons, "~> 0.5.0"},
      {:bandit, "~> 1.5"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:esbuild, "~> 0.8", only: :dev},
      {:tailwind, "~> 0.3", only: :dev},
      {:jason, "~> 1.2", only: [:dev, :test]},
      {:floki, ">= 0.30.0", only: :test},
      {:ex_doc, "~> 0.34", only: :dev, runtime: false}
    ]
  end

  defp description do
    """
    A comprehensive Phoenix LiveView component library based on HyperUI Tailwind CSS components.
    """
  end

  defp package do
    [
      maintainers: ["dre1080"],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url},
      files: ~w(lib storybook mix.exs README.md LICENSE)
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md"]
    ]
  end
end
