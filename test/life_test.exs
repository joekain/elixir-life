defmodule LifeTest do
  use ExUnit.Case

  test "It should seed the board" do
    file = "test_data/single10x10.dat"
    {:ok, expected} = File.read file

    assert Life.seed_board({ [seed: file], [], [] })
    |> Life.to_string == expected
  end
  
  test "It should run iterations" do
    {:ok, empty} = File.read "test_data/empty10x10.dat"
    
    assert { [seed: "test_data/single10x10.dat"], [], [] }
    |> Life.seed_board
    |> Life.tick
    |> Life.to_string == empty
  end
  
  test "It should run the game" do
    {:ok, expected} = File.read "test_data/empty10x10.dat"

    assert { [seed: "test_data/single10x10.dat"], [], [] }
    |> Life.run_game(fn (output) -> output end) == expected
  end
end
