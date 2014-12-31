#!/bin/sh

# Rule 2: Any live cell with two or three live neighbours lives on to the next 
# generation.
#
# Test stable block of 4 live cells

. integration/utils.sh "Stable Block of 4 Test"

function main () {
  output=$(run_application_iterations 1 "\"--seed\", \"four10x10.dat\"")
  validate $output "four10x10.dat"

  pass
}

main
