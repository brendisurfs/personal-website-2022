open Layout

@react.component
let make = () => {
  /* <Layout> <div> {"Testing Three on Homepage"->React.string} </div> <ThreeCanvas /> </Layout> */
  <Layout>
    <div> {"Testing Three on Homepage"->React.string} </div> <canvas id="3d-canvas" />
  </Layout>
}
