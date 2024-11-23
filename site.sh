#!/bin/bash

usage() {
  echo "usage: $(basename $0) s|b"
  exit 1
}

if [[ "$#" -ne 1 ]]; then
  bundle exec jekyll serve # build if no commands are provided
  exit 0
fi

case "$1" in
  s)
    bundle exec jekyll serve
    ;;
  b)
    bundle exec jekyll build
    ;;
  *)
    echo "ERROR: command $1 unrecognized"
    usage
    ;;
esac
