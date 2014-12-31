#!/bin/sh

. integration/integration.sh

mix test

integration_runner $*