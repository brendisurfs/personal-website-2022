open Layout
open Queries

@react.component
let make = () => {
  open React
  let homepageRes = switch HomeQuery.use() {
  | {loading: true} => "loading..."->string
  | {error: Some(_error)} => "Error loading projects :/"->string
  | {data: Some({workProjects})} => <ThreeCanvas />
  | {data: None, error: None, loading: false} => "No data? no projects? This seems weird"->string
  }
  // -- view
  <Layout> {homepageRes} </Layout>
}
