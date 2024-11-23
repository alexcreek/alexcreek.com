#!/bin/bash

usage() {
  echo "usage: $(basename $0) s|b"
  exit 1
}

if [[ "$#" -ne 1 ]]; then
  usage
fi

case "$1" in
  s)
    bundle exec jekyll serve
    ;;
  b)
    bundle exec jekyll build
    ;;
  *)
    echo "ERROR: option $1 unrecognized"
    usage
    ;;
esac
