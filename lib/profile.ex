defmodule Profile do
  import ExProf.Macro

  def go do
    :eflame.apply(&run_test/0, [])
  end 
  
  def run_test, do: Life.CLI.main(["--animated", "--iterations", "5", "--seed", "test_data/glider1.dat"])
end