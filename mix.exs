defmodule Dum.Mixfile do
  use Mix.Project

  def project do
    [app: :dum,
     version: "0.0.2",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:cowboy, :plug, :logger, :exrm, :conform, :conform_exrm], mod: {Dum, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:cowboy, "~> 1.0.4"},
     {:plug, "~> 1.1"},
     {:exrm, "~> 1.0.0-rc7"},
     {:conform, "~> 1.0.0-rc8"},
     {:conform_exrm, "~> 0.2.0"}]
  end
end
