. integration/integration.sh $*

function run_application_iterations () {
  count=$1
  shift
  other_args=$*

  output=`result_file`
  mix compile > /dev/null
  mix run -e \
    "Life.CLI.main([\"--size\", \"10,10\", \"--iterations\", $count, $other_args])" \
      > $output
  echo $output
}

function validate () {
  output=$1
  expected=$2
  diff -u $1 $(gold $expected) || fail "Expected to match $expected"
}

function single_tick_test () {
  seed=$(gold $1)
  expected=$2
  
  output=$(run_application_iterations 1 "\"--seed\", \"$seed\"")
  validate $output $expected

  pass
}