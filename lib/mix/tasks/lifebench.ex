defmodule Mix.Tasks.Lifebench do
  use Mix.Task
  
  @shortdoc "Benchmark the Game of Life"

  @moduledoc """
  Run a benchmark and save results
  """
  
  @number_of_runs 10
  
  def run(_) do
    prepare
    
    collect_results(&Profile.run_test/0)
    |> write_results
  end
  
  defp prepare do
    Mix.Project.get!
    Mix.Task.run("compile", [])
    Mix.Task.run("loadpaths", [])
  end
  
  def collect_results(f) do
    Stream.repeatedly(fn -> time(f) end) |> Stream.take(@number_of_runs)
  end
  
  defp time(f) do
    {time, _value} = :timer.tc(f)
    time
  end
  
  defp write_results(results) do
    results
    |> Enum.to_list
    |> Enum.map(fn (result) -> IO.puts result end)
  end
end
