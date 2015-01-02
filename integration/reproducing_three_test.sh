#!/bin/sh

# Rule 4: Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
#
# Test set of 3 cells.

. integration/utils.sh "Reproduction Test"

function main () {
  output=$(run_application_iterations 1 "\"--seed\", \"test_data/three10x10.dat\"")
  validate $output "four10x10.dat"

  pass
}

main
