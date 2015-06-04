defmodule Life do
  alias Life.Board

  @live 79  # O
  @dead 32  # <space>

  def run_game(args, display \\ &IO.write/1) do
    args
    |> seed_board
    |> output(display, animated?(args))
    |> run_loop(iterations(args), display)
  end

  def  seed_board({args, _, _}), do: Keyword.get(args, :seed) |> do_seed_board
  defp do_seed_board(nil),      do: empty_board
  defp do_seed_board(seedfile), do: Board.new_from_file(seedfile)

  defp empty_board, do: do_seed_board("test_data/empty10x10.dat")

  defp iterations({args, _, _}), do: Keyword.get(args, :iterations)
  defp animated?({args, _, _}),  do: Keyword.get(args, :animated)

  defp run_loop(board, 0, _display), do: board
  defp run_loop(board, nil, _display), do: board
  defp run_loop(board, count, display) do
    board
    |> tick
    |> output(display)
    |> run_loop(count - 1, display)
  end

  defp tick(board), do:
    board |> Board.map(fn (key, value) -> apply_rules(key, value, board) end)

  @spec apply_rules({Integer, Integer}, char(), Board.t) :: Integer
  defp apply_rules({x, y}, value, board) do
    case {value, count_live_neighbors(x, y, board)} do
      {v, c} when (v == @live) and (c < 2)            -> @dead
      {v, c} when (v == @live) and (c == 2 or c == 3) -> @live
      {v, c} when (v == @live) and (c > 3)            -> @dead
      {v, c} when (v == @dead) and (c == 3)           -> @live
      {v, _}                                          -> v
    end
  end

  @spec count_live_neighbors(Integer, Integer, any) :: integer()
  defp count_live_neighbors(x, y, board) do
    list_of_neighbors(x, y, board)
    |> Enum.map(&state_as_int/1)
    |> Enum.sum
    |> round
  end

  defp list_of_neighbors(x, y, board) do
    for dx <- [-1, 0, 1], dy <- [-1, 0, 1], {dx, dy} != {0, 0}, do: board[{x + dx, y + dy}]
  end

  defp state_as_int(@live),                           do: 1
  defp state_as_int(_dead_or_nil_when_out_of_bounds), do: 0

  defp output(board, display, enable \\ true) do
    if enable do
      board
      |> board_to_string
      |> display.()
    end

    board
  end

  @spec board_to_string(Board.t) :: String.t
  def board_to_string(board), do: Board.to_string(board)

end
