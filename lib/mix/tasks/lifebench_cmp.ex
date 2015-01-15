defmodule Mix.Tasks.Lifebench.Cmp do
  use Mix.Task
  alias Statistics, as: Stats
  
  @shortdoc "Compare Benchmarks of the Game of Life"

  @moduledoc """
  Compare results from previous lifebench runs.
  
  Usage: mix lifebench <results file 1> <results file 2>
  """
  
  def run(args) do
    args
    |> parse_args
    |> compare
  end
  
  defp compare(files) do
    files
    |> Enum.map(&load_results(&1))
    |> Enum.map(&compute_stats(&1))
    |> compute_t_value
    |> report
  end
  
  defp load_results(filename) do
    File.stream!(filename) 
    |> Enum.to_list 
    |> Enum.map(&String.strip(&1))
    |> Enum.map(&String.to_integer(&1))
  end
  
  defp compute_stats(results) do
    {
      Enum.count(results),
      Stats.mean(results),
      Stats.stdev(results)
    }
  end

  defp compute_t_value(stats) do
    a = compute_a(stats)
    b = compute_b(stats)
    t = compute_t(a, b, stats)
    {stats, t}
  end
  
  defp compute_a([{n1, _, _}, {n2, _, _}]) do
    (n1 + n2) / (n1 * n2)
  end
  
  defp compute_b([{n1, _, s1}, {n2, _, s2}]) do
    ( ((n1 - 1) * s1 * s1) + ((n2 - 1) * s2 * s2) ) / (n1 + n2 - 2)
  end
  
  defp compute_t(a, b, [{_, u1, _}, {_, u2, _}]) do
    abs(u1 - u2) / :math.sqrt(a * b)
  end
  
  defp report({stats, t}) do
    IO.puts "t value: #{t}"
  end
  
  defp parse_args(args) do
    case OptionParser.parse(args, strict: []) do
      {[], [name1, name2], []} -> [name1, name2]
      {_, _, _}                -> usage
    end
  end
  
  defp usage do
    Kernel.exit("Usage: mix lifebench.cmp <results file 1> <results file 2>")
  end
end