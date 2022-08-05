open Layout
open Queries

@react.component
let make = () => {
  open React
  let writingRes = switch PageQuery.use({pageSlug: "Writing Page"}) {
  | {loading: true} => "loading..."->string
  | {error: Some(_error)} => "error loading writing"->string
  | {data: Some({data})} =>
    switch data {
    | Some(val) => <Listing list=val.components />
    | None => "No writing"->React.string
    }
  | {data: None, error: None, loading: false} => "no writing...yet!"->string
  }
  <Layout> {writingRes} </Layout>
}
