defmodule Mix.Tasks.Lifebench do
  use Mix.Task

  @shortdoc "Benchmark the Game of Life"

  @moduledoc """
  Run a benchmark and save results to a results file.

  Usage: mix lifebench <results file>
  """

  @number_of_runs 10

  def run(args) do
    prepare

    collect_results(&Profile.run_test/0)
    |> write_results(args)
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

  defp write_results(results, args) do
    f = get_output_file(args)

    results
    |> Enum.to_list
    |> Enum.map(fn (result) -> IO.puts(f, "#{result}") end)
  end

  defp get_output_file(args) do
    case OptionParser.parse(args, strict: []) do
      {[], [name], []} -> open_output_file(name)
      {_, _, _}        -> usage
    end
  end

  defp open_output_file(name) do
    case File.open(name, [:write]) do
      {:ok, file} -> file
      _           -> usage
    end
  end

  @spec usage :: no_return
  defp usage do
    Kernel.exit("Usage: mix lifebench <results file>")
  end
end
