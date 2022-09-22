open Layout
open Queries
// takes in the data, use the router.

@react.component
let make = (~slug) => {
  switch BlogDetailQuery.use({blogSlug: slug}) {
  | {loading: true} => Js.log("...one sec")
  | {error: Some(_error)} => Js.log("error loading writing")
  | {data: Some(data)} => Js.log(data)
  | _ => Js.log("unknown error")
  }

  <Layout> <div> {"This is a template "->React.string} </div> </Layout>
}
