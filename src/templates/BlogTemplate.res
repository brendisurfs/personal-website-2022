open Layout
// takes in the data, use the router.

module BlogDetail = {
  @react.component
  let make = () => {
    let url = RescriptReactRouter.useUrl()
    <Layout> <div> {"This is a template "->React.string} </div> </Layout>
  }
}
