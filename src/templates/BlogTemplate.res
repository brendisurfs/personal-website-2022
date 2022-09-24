open Layout
open Queries
// takes in the data, use the router.
module BlogLayout = {
  open Belt
  type blogDetailPayload = Queries.BlogDetailQuery.t

  @react.component
  let make = (~data: BlogDetailQuery.BlogDetailQuery_inner.t) => {
    switch data.componentBlog {
    | Some(v) => {
        let unwrappedData = Option.getExn(v.body)->Js.Json.stringifyAny
        let jsonData = unwrappedData->Option.getExn
        Js.log("woo: " ++ jsonData)
      }
    | None => Js.log("none")
    }
    <div />
  }
}

@react.component
let make = (~slug) => {
  let blogDetailElement = switch BlogDetailQuery.use({blogSlug: slug}) {
  | {loading: true} => <div> {"one sec..."->React.string} </div>
  | {error: Some(_error)} => <div> {"error while loading!"->React.string} </div>
  | {data: Some(data)} => <BlogLayout data />
  | _ => <div> {"weird, nothing found..."->React.string} </div>
  }

  <Layout> <div> blogDetailElement </div> </Layout>
}
