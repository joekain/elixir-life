defmodule Life do
  def seed_board({args, _, _}) do
    Keyword.get(args, :seed) |> do_seed_board
  end
  
  defp do_seed_board(nil), do: empty_board
  defp do_seed_board(seedfile) do
    {:ok, seed} = File.read(seedfile)
    map_from_string(seed)
  end
  
  defp empty_board, do: do_seed_board("test_data/empty10x10.dat")

  def tick(_board) do
    empty_board
  end
  
  def to_string(board) do
    board
    |> Map.keys
    |> Enum.sort(&coordinate_preceeds?/2)
    |> sorted_map_to_char_list(board)
    |> List.to_string
  end
  
  def map_from_string(string) do
    Map.new |> insert(0, 0, String.to_char_list(string))
  end
  
  defp insert(map, _x, _y, []), do: map
  defp insert(map, _x,  y, [10 | list]), do: insert(map, 0, y + 1, list)  
  defp insert(map,  x,  y, [char | list]) do
    new_map = Map.put(map, {x, y}, char)
    insert(new_map, x + 1, y, list)
  end
  
  defp coordinate_preceeds?({x1, y1}, {x2, y2}) do
    cond do      
      (y1 < y2) ->               true
      (y1 == y2) && (x1 < x2) -> true
      true ->                    false
    end
  end
  
  def sorted_map_to_char_list(sorted_list, board) do
    current_y = 0
    do_transform(sorted_list, board, current_y)
  end
  
  defp do_transform([], _board, _current_y), do: [10]
  defp do_transform([{x,y} | tail], board, current_y) do
    cond do
      y == current_y -> [ board[{x,y}] | do_transform(tail, board, y) ]
      true           -> [ 10, board[{x,y}] | do_transform(tail, board, y) ]
    end
  end
end
