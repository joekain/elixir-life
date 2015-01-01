defmodule CLITest do
  use ExUnit.Case
  alias Life.CLI

  test "It parses --seed" do
    file = "afile.dat"
    assert CLI.parse_args(["--seed", file]) == { [seed: file], [], [] }
  end
end
