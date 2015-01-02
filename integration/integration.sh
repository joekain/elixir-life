function init () {
  if [ -n "$1" ]; then
    TEST_NAME=$*
  else
    TEST_NAME="Unnamed test"
  fi
}

function pass () {
  echo $(green PASS:) $TEST_NAME
  exit 0
}

function fail () {
  echo $(red FAIL:) $TEST_NAME $(red $*)
  exit -1
}

function green () {
  TEXT=$1
  echo "\033[1;32m$TEXT\033[0m"
}

function red () {
  TEXT=$*
  echo "\033[1;31m$TEXT\033[0m"
}

function result_file () {
  mkdir -p test_data
  echo "test_data/temp"
}

function gold () {
  echo "test_data/$1"
}

function integration_runner () {
  echo "\nIntegration Tests:"
  for test in integration/*_test.sh ; do
    $test
  done
  
  if [ "$1" == "--pending" -a -e integration/*_test_p.sh ]; then
    echo "\nPending Integration Tests:"
    for test in integration/*_test_p.sh ; do
      $test
    done
  fi
}

init $*
