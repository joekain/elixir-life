defmodule Profile do
  import ExProf.Macro

  def go do
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
  
  def run_test, do: Life.CLI.main(["--animated", "--iterations", "5", "--seed", "test_data/glider1.dat"])
end