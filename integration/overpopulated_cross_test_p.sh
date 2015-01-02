#!/bin/sh

# Rule 3: Any live cell with more than three live neighbours dies, as if by overcrowding.
#
# Test stable cross of 5 cells such that center cell dies.

. integration/utils.sh "Overpopulated Cross"

function main () {
  output=$(run_application_iterations 1 "\"--seed\", \"test_data/fiveCross10x10.dat\"")
  validate $output "fourCross10x10.dat"

  pass
}

main
