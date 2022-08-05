open Layout
open Queries

@react.component
let make = () => {
  open React
  let writingRes = switch PageQuery.use({pageSlug: "Writing"}) {
  | {loading: true} => "loading..."->string
  | {error: Some(_error)} => "error loading writing"->string
  | {data: Some({writing})} => <div> {"writing"->string} </div>
  | {data: None, error: None, loading: false} => "no writing...yet!"->string
  }
  <Layout> {writingRes} </Layout>
}
