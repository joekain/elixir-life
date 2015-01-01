defmodule Life.CLI do
  @moduledoc """
  Handle command line parsing and dispatch to commands.
  """
  
  def main(_args \\ System.argv) do
    display
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
