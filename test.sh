#!/bin/sh

mix test

echo "\nIntegration Tests:"
for test in integration/*_test.sh ; do
  $test
done
