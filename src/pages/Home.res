open Layout
open ReScriptUrql

module HomeQuery = %graphql(`
  query HomeQuery {
    allComponentProjects {
      id
      title
    }
  }
`)

@react.component
let make = () => {
  // -- data
  let ({Hooks.response: response}, executeQuery) = Hooks.useQuery(~query=module(HomeQuery), ())
  // -- view
  open React
  <Layout> <div> {"Home page"->string} </div> </Layout>
}
