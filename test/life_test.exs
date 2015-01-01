defmodule LifeTest do
  use ExUnit.Case

  test "It should seed the board" do
    file = "test_data/single10x10.dat"
    {:ok, expected} = File.read file

    assert Life.seed_board({ [seed: file], [], [] })
    |> to_string == expected
  end
end
