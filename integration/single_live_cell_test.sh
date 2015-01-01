#!/bin/sh

# Rule 1: Any live cell with fewer than two live neighbours dies, as if caused 
# by under-population.
#
# Test live cell with zero neighbors

. integration/utils.sh "Single Live Cell Test"

function main () {
  output=$(run_application_iterations 1 "\"--seed\", \"test_data/single10x10.dat\"")
  validate $output "empty10x10.dat"

  pass
}

main
