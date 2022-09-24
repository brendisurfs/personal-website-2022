open Layout

// styles
module Canvas = {
  let container = `
    width: 100%;
    display: flex;
    justify-content: center;
`->Emotion.rawCss
}

//component
@react.component
let make = () => {
  /* <Layout> <div> {"Testing Three on Homepage"->React.string} </div> <ThreeCanvas /> </Layout> */

  <Layout>
    <div> {"Testing Three on Homepage"->React.string} </div>
    <div className={Canvas.container}> <canvas id="bevy" /> </div>
  </Layout>
}
