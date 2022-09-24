open Layout

%%raw(`
      import init from "@wasm/out-wasm/brendancreates-wasm.js";
      const run = async () => {
          await init();
      }
      run().catch(console.error);
`)

@react.component
let make = () => {
  /* <Layout> <div> {"Testing Three on Homepage"->React.string} </div> <ThreeCanvas /> </Layout> */
  <Layout>
    <div> {"Testing Three on Homepage"->React.string} </div> <canvas id="3d-canvas" />
  </Layout>
}
