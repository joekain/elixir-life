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

init $*
