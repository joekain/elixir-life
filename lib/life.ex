defmodule Life do
  def seed_board({args, _, _}) do
    Keyword.get(args, :seed) |> do_seed_board
  end
  
  defp do_seed_board(nil), do: ""
  defp do_seed_board(seedfile) do
    {:ok, board} = File.read(seedfile)
    board
  end

end
