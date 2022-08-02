open Layout

module HomeQuery = %graphql(`
  query HomeQuery {
    projects: allComponentProjects {
      id
      title
    }
  }
`)

@react.component
let make = () => {
  // -- data
  open React
  let homepageRes = switch HomeQuery.use() {
  | {loading: true} => "loading..."->string
  | {error: Some(_error)} => "Error loading projects :/"->string
  | {data: Some({projects})} => projects->Belt.Array.length->React.int
  | {data: None, error: None, loading: false} => "No data? no projects? This seems weird"->string
  }
  // -- view
  <Layout> <pre> {homepageRes} </pre> </Layout>
}
