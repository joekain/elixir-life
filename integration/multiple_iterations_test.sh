#!/bin/sh

# Test through several iterations with the pulsar, occilating, pattern

. integration/utils.sh "Multiple Iterations Test"

seed=$(gold "pulsar1.dat")
expected="pulsar2,3.dat"

output=$(run_application_iterations 2 "\"--seed\", \"$seed\"")
validate $output $expected

pass
