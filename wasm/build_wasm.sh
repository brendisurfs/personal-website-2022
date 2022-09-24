#!/bin/bash
cargo build --release --target wasm32-unknown-unknown
wasm-bindgen --out-dir ./out-wasm --no-typescript --target web target/wasm32-unknown-unknown/release/brendancreates-wasm.wasm

