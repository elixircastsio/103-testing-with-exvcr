defmodule Teacher.MixProject do
  use Mix.Project

  def project do
    [
      app: :teacher,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:httpoison, "~> 1.5"},
      {:exvcr, "~> 0.10.4", only: :test},
      {:jason, "~> 1.0"}
    ]
  end
end
