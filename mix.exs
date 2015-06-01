defmodule Life.Mixfile do
  use Mix.Project

  def project do
    [app: :life,
     version: "0.0.1",
     elixir: "~> 1.0.0",
     deps: deps,
     dialyzer: [
       paths: [
         "_build/dev/lib/eflame/ebin",
         # "_build/dev/lib/exprintf/ebin/"  # too many warnings in exprintf
         "_build/dev/lib/exprof/ebin/",
         "_build/dev/lib/life/ebin",
         "_build/dev/lib/statistics/ebin",
       ]
     ]
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      { :exprof, "~> 0.1" },
      { :eflame, ~r/.*/, git: "https://github.com/proger/eflame.git", compile: "rebar compile"},
      { :statistics, "~> 0.2.0"}
    ]
  end
end
