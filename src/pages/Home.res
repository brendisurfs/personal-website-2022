// open Layout
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
  let res = switch response {
  | Fetching => "fetching"
  | Data(d)
  | PartialData(d, _) =>
    d.allComponentProjects->Js.String.make
  | Error(e) => e->Js.String.make
  | Empty => "empty!"
  }

  // -- view
  open React
  <pre> {res->string} </pre>
  // <Layout> <div> {"Home page"->string} </div> </Layout>
}
