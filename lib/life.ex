defmodule Life do
  alias Life.Board

  def seed_board({args, _, _}) do
    Keyword.get(args, :seed) |> do_seed_board
  end
  
  defp do_seed_board(nil), do: empty_board
  defp do_seed_board(seedfile) do
    Board.new_from_file(seedfile)
  end
  
  defp empty_board, do: do_seed_board("test_data/empty10x10.dat")

  def tick(_board) do
    empty_board
  end
  
  def to_string(board), do: Board.to_string(board)
end
