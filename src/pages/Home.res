open Layout
open Promise

let wasmPromise =
  WasmLoader.init()
  ->Promise.then(x => {
    Js.log(x)
    resolve()
  })
  ->catch(e => {
    Js.log(e)
    resolve()
  })
@react.component
let make = () => {
  <Layout> <div /> </Layout>
}
