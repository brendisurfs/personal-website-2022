open Layout
open Promise

let wasmPromise = WasmLoader.init()->Promise.then(data => Js.log(data)->resolve)->ignore

@react.component
let make = () => {
  <Layout> <div /> </Layout>
}
