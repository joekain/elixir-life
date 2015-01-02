defmodule Life.Board do
  def new_from_file(seedfile) do
    {:ok, seed} = File.read(seedfile)
    new_from_string(seed)
  end
  
  def new_from_string(string) do
    Map.new |> insert(0, 0, String.to_char_list(string))
  end
  
  defp insert(map, _x, _y, []), do: map
  defp insert(map, _x,  y, [10 | list]), do: insert(map, 0, y + 1, list)  
  defp insert(map,  x,  y, [char | list]) do
    new_map = Map.put(map, {x, y}, char)
    insert(new_map, x + 1, y, list)
  end
  
  def to_string(board) do
    board
    |> Map.keys
    |> Enum.sort(&coordinate_preceeds?/2)
    |> sorted_map_to_char_list(board)
    |> List.to_string
  end
  
  defp coordinate_preceeds?({x1, y1}, {x2, y2}) do
    cond do      
      (y1 < y2) ->               true
      (y1 == y2) && (x1 < x2) -> true
      true ->                    false
    end
  end
  
  defp sorted_map_to_char_list(sorted_list, board) do
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