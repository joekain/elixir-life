#!/bin/sh

. integration/integration.sh "Initial State Test"

function main () {
  output=$(run_application)
  validate_size $output
  validate_empty $output

  pass
}

function run_application () {
  output=`result_file`
  mix compile > /dev/null
  mix run -e 'Life.CLI.main(["--size", "10,10", "--iterations", "1"])' > $output
  echo $output
}

function validate_size () {
  output=$1
  expected="      10       0     110 $output"
  [ "$(wc $output)" == "$expected" ] || fail "Expected size 10x10"
}

function validate_empty () {
  grep -v " " $1 > /dev/null && fail "Expected empty game board"
}

main
