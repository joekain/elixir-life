defmodule Profile do
  import ExProf.Macro

  def go do
    :fprof.apply(&run_test/0, [])
    :fprof.profile()
    :fprof.analyse()
  end 
  
  defp run_test, do: Life.CLI.main(["--animated", "--iterations", "5", "--seed", "test_data/glider1.dat"])
end