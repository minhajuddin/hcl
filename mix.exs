defmodule Hcl.Mixfile do
  use Mix.Project

  def project do
    [
      app: :hcl,
      description: "A performant HTTP client written in pure Elixir",
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      package: package(),
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Hcl.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:http_parser, path: "../http_parser"},

      {:ex_doc, ">= 0.0.0", only: :dev},
    ]
  end

  defp package do
    [
      files: ~w(lib mix.exs README.md LICENSE),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/minhajuddin/hcl"},
      maintainers: ["Khaja Minhajuddin"],
    ]
  end
end
