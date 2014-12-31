#!/bin/sh

. integration/utils.sh "Initial State Test"

function main () {
  output=$(run_application_iterations 1)
  validate $output "empty10x10.dat"

  pass
}

main
