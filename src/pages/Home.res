open Layout
open ThreeCanvas

@react.component
let make = () => {
  <Layout> <div> {"Testing Three on Homepage"->React.string} </div>
  <ThreeCanvas />
  </Layout>
}
