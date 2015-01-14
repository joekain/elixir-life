defmodule Mix.Tasks.Lifebench do
  use Mix.Task
  
  @shortdoc "Benchmark the Game of Life"

  @moduledoc """
  Run a benchmark and save results
  """
  def run(_) do
    collect_results(&Profile.run_test/0)
    |> Enum.to_list
    |> IO.inspect
  end
  
  def collect_results(f) do
    Stream.repeatedly(fn -> time(f) end) |> Stream.take(10)
  end
  
  defp time(f) do
    {time, _value} = :timer.tc(f)
    time
  end
end