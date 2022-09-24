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

module BlogLayout = {
  type blogDetailPayload = Queries.BlogDetailQuery.t

  @react.component
  let make = (~data: BlogDetailQuery.BlogDetailQuery_inner.t) => {
    switch data.componentBlog {
    | Some(v) => Js.log(v)
    | None => Js.log("none")
    }
    <div />
  }
}
