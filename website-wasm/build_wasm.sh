#!/bin/bash

# Looks for `name = "crate_name"`, gets the third word (`"crate_name"`) and removes the quotes.
CRATE_NAME=$(grep name Cargo.toml | awk '{ print $3 }' | tr -d '"')

cargo build --release --target wasm32-unknown-unknown

wasm-bindgen --out-dir wasm/target --target web target/wasm32-unknown-unknown/release/${CRATE_NAME}.wasm

basic-http-server wasm

