defmodule Life.CLI do
  @moduledoc """
  Handle command line parsing and dispatch to commands.
  """
  
  def main(args \\ System.argv) do
    args
    |> parse_args
    |> Life.seed_board
    display
  end
  
  def parse_args(args) do
    OptionParser.parse(args, strict: [seed: :string])
  end
  
  defp display do
    IO.puts "          "
    IO.puts "          "
    IO.puts "          "
    IO.puts "          "
    IO.puts "          "
    IO.puts "          "
    IO.puts "          "
    IO.puts "          "
    IO.puts "          "
    IO.puts "          "
  end
end
