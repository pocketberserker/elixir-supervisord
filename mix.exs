defmodule Supervisord.Mixfile do
  use Mix.Project

  @description """
    Supervisord library for Elixir
  """

  def project do
    [app: :supervisord,
     version: "0.1.0",
     elixir: "~> 1.3",
     name: "Supervisord",
     description: @description,
     package: package,
     deps: deps,
     source_url: "https://github.com/pocketberserker/elixir-supervisord" ]
  end

  def application do
    [applications: [:xmlrpc, :httpoison]]
  end

  defp deps do
    [{:erlsom, github: "willemdj/erlsom"},
     {:xmlrpc, "~> 1.0"},
     {:httpoison, "~> 0.9"}]
  end

  defp package do
    [files: ~w(lib mix.exs README.md LICENSE),
     maintainers: ["pocketberserker"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/pocketberserker/elixir-supervisord"}]
  end
end
