open Layout
open Queries

@react.component
let make = () => {
  let res = switch AboutQuery.use() {
  | {loading: true} => "loading..."->React.string
  | {error: Some(_error)} => "Error loading projects :/"->React.string
  | {data: Some({about})} => <PageRecord data=about />
  | {data: None, error: None, loading: false} =>
    "No data? no projects? This seems weird"->React.string
  }
  <Layout> <div> {res} </div> </Layout>
}
