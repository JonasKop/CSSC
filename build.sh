#!/usr/bin/env bash

set -e

NAME=cssc
cargo build --target x86_64-apple-darwin
rm ./alfred/$NAME
mv ./target/x86_64-apple-darwin/debug/$NAME ./alfred/$NAME
zip -r -j CSSC.alfredworkflow alfred/*
