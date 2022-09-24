open Layout
open Queries
open Emotion

module BlogStyle = {
  let container = `
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  width: 100%;
  `->rawCss

  let textBlock = `
  font-family: sans-serif;
  font-weight: 300;
  width: 50%;
  display: flex;
  flex-direction: column;
  color: white;
  `->rawCss
}

// takes in the data, use the router.
module BlogLayout = {
  open Belt
  open DatoParser
  type blogDetailPayload = Queries.BlogDetailQuery.t

  @react.component
  let make = (~data: BlogDetailQuery.BlogDetailQuery_inner.t) => {
    switch data.componentBlog {
    | Some(v) => {
        let unwrappedData = render(v.body->Option.getExn)
        <div className={BlogStyle.textBlock} dangerouslySetInnerHTML={"__html": unwrappedData} />
      }
    | None => <div />
    }
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

  <Layout> <div className={BlogStyle.container}> blogDetailElement </div> </Layout>
}
