open Layout

%%raw(`
      import init from "@wasm/out-wasm/brendancreates-wasm.js";
      init("@wasm/out-wasm/brendancreates-wasm_bg.wasm");
`)

@react.component
let make = () => {
  /* <Layout> <div> {"Testing Three on Homepage"->React.string} </div> <ThreeCanvas /> </Layout> */
  <Layout>
    <div> {"Testing Three on Homepage"->React.string} </div> <canvas id="3d-canvas" />
  </Layout>
}
