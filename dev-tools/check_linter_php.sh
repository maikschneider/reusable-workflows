#!/bin/sh

find ./*.php . -name '*.php' ! -path './vendor/*'  ! -path './var/*' ! -path '*node_modules/*' ! -path './public/*' -print0 | xargs -0 -n 1 -P 4 php -l