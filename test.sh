#!/bin/sh

. integration/integration.sh

mix test || exit -1

integration_runner $*