#!/bin/sh

# Rule 1: Any live cell with fewer than two live neighbours dies, as if caused 
# by under-population.
#
# Test live cell with zero neighbors

. integration/utils.sh "Single Live Cell Test"

single_tick_test "single10x10.dat" "empty10x10.dat"
