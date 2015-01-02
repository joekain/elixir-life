defmodule Profile do
  import ExProf.Macro

  def go do
    profile do
      Life.CLI.main(["--iterations", "100", "--seed", "test_data/pulsar1.dat"])
    end
  end 
end