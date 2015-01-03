defmodule Profile do
  import ExProf.Macro

  def eflame do
    :eflame.apply(&run_test/0, [])
  end 
  
  def fprof do
    :fprof.apply(&run_test/0, [])
    :fprof.profile()
    :fprof.analyse(
      [
        callers: true,
        sort: :own,
        totals: true,
        details: true
      ]
    )
  end
  
  def eprof, do:
    profile do: run_test

  def run_test, do: Life.CLI.main(["--animated", "--iterations", "5", "--seed", "test_data/glider1.dat"])
end