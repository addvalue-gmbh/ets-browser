defmodule EtsBrowser.MixProject do
  use Mix.Project

  def project do
    [
      app: :ets_browser,
      version: "0.1.3",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      source_url: "https://github.com/addvalue-gmbh/ets-browser"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug, "~> 1.9"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:html_entities, "~> 0.4"}
    ]
  end

  defp description() do
    "A simple web-based viewer of data stored in ETS."
  end

  defp package() do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/addvalue-gmbh/ets-browser"}
    ]
  end
end
