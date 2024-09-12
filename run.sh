#!/bin/bash

base=$( realpath $( dirname $0 ) )


docker build -t msf $base

mkdir -p $base/msf
docker run --rm -it \
  -v $base:/msf \
  -w /msf \
  msf
