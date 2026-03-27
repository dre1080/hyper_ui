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
      source_url: @source_url
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:phoenix_live_view, "~> 1.0.0-rc or ~> 1.0"},
      {:jason, "~> 1.2", only: [:docs, :dev, :test]},
      {:floki, ">= 0.30.0", only: :test},
      {:ex_doc, "~> 0.34", only: [:docs, :dev], runtime: false}
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
      files: ~w(lib .formatter.exs mix.exs README.md LICENSE)
    ]
  end

  defp docs do
    [
      main: "readme",
      source_ref: "v#{@version}",
      source_url: @source_url,
      extras: ["README.md"],
      groups_for_modules: [
        Components: [
          HyperUI.Components.ApplicationUI,
          HyperUI.Components.ApplicationUI.Forms,
          HyperUI.Components.Ecommerce,
          HyperUI.Components.Marketing,
          HyperUI.Components.Neobrutalism
        ]
      ],
      filter_modules: fn module, _metadata ->
        !String.starts_with?(to_string(module), "Elixir.HyperUIWeb")
      end
    ]
  end
end
