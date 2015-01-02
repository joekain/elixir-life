defmodule LifeTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "It should seed the board" do
    file = "test_data/single10x10.dat"
    {:ok, expected} = File.read file

    assert Life.seed_board({ [seed: file], [], [] })
    |> Life.board_to_string == expected
  end
  
  test "It should run the game" do
    {:ok, expected} = File.read "test_data/empty10x10.dat"

    assert capture_io(fn ->
      { [seed: "test_data/single10x10.dat", iterations: 1], [], [] }
      |> Life.run_game(&IO.write/1)
    end) == expected
  end
end
