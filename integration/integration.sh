function init () {
  if [ -n "$1" ]; then
    TEST_NAME=$*
  else
    TEST_NAME="Unnamed test"
  fi
}

function pass () {
  echo $(green PASS:) $TEST_NAME  
  true
}

function fail () {
  echo $(red FAIL:) $TEST_NAME
  false
}

function green () {
  TEXT=$1
  echo "\033[1;32m$TEXT\033[0m"
}

function red () {
  TEXT=$1
  echo "\033[1;31m$TEXT\033[0m"
}

init $*