#!/bin/sh

# Rule 4: Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
#
# Test set of 3 cells.

. integration/utils.sh "Reproduction Test"

single_tick_test "three10x10.dat" "four10x10.dat"
