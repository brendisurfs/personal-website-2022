// instantiateStreaming -> transform obj
fetch("/wasm/test.wasm")
  .then(res => res.arrayBuffer())
  .then(bytes => WebAssembly.instantiate(bytes))
  .then(res => console.log(res))
