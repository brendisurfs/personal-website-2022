open Layout

let wasi = WasmLoader.init()
Js.log(wasi)
@react.component
let make = () => {
  <Layout> <ThreeCanvas /> </Layout>
}
