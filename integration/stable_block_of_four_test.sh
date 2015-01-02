#!/bin/sh

# Rule 2: Any live cell with two or three live neighbours lives on to the next 
# generation.
#
# Test stable block of 4 live cells

. integration/utils.sh "Stable Block of 4 Test"

single_tick_test "four10x10.dat" "four10x10.dat"
