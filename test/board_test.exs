defmodule BoardTest do
  use ExUnit.Case
  alias Life.Board

  test "It can map one board to another" do
    {:ok, empty} = File.read "test_data/empty10x10.dat"
    
    assert "test_data/single10x10.dat"
    |> Board.new_from_file
    |> Board.map(fn (_, _) -> ' ' end)
    |> Board.to_string == empty
  end
end