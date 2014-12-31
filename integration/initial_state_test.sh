#!/bin/sh

. integration/integration.sh "Initial State Test"

function main () {
  output=$(run_application)
  validate $output

  pass
}

function run_application () {
  output=`result_file`
  mix compile > /dev/null
  mix run -e 'Life.CLI.main(["--size", "10,10", "--iterations", "1"])' > $output
  echo $output
}

function validate () {
  output=$1
  expected=empty10x10.dat
  diff -u $1 $(gold empty10x10.dat) || fail "Expected to match empty10x10.dat"
}

main
