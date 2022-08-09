open Layout
@module("src/components/ThreeJS/TestingThree") external renderThree: unit => unit = "renderThree"

@react.component
let make = () => {
  renderThree()
  <Layout> <div> {"cum"->React.string} </div> </Layout>
}
