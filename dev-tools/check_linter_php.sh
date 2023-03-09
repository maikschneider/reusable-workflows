#!/bin/sh

find *.php . -name '*.php' ! -path './vendor/*'  ! -path './var/*' ! -path '*node_modules/*' -print0 | xargs -0 -n 1 -P 4 php -l