open Layout
open Queries

@react.component
let make = () => {
  let res = switch PageQuery.use({pageSlug: "About Page"}) {
  | {loading: true} => "loading..."->React.string
  | {error: Some(_error)} => "Error loading projects :/"->React.string
  | {data: Some({data})} =>
    switch data {
    | Some(val) => <PageRecord data=val />
    | None => "No value"->React.string
    }
  | {data: None, error: None, loading: false} =>
    "No data? no projects? This seems weird"->React.string
  }
  <Layout> <div> {res} </div> </Layout>
}
