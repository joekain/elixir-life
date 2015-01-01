defmodule LifeTest do
  use ExUnit.Case

  test "It should seed the board" do
    file = "test_data/single10x10.dat"
    {:ok, expected} = File.read file

    assert Life.seed_board({ [seed: file], [], [] })
    |> to_string == expected
  end
  
  test "It should run iterations" do
    {:ok, empty} = File.read "test_data/empty10x10.dat"
    
    assert { [seed: "test_data/single10x10.dat"], [], [] }
    |> Life.seed_board
    |> Life.tick
    |> to_string == empty
  end
end
