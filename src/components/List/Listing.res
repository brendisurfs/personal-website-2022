open Queries
open FilterOption
// listing component for writings home page, not detail.

@react.component
let make = (~list: array<PageQuery.PageQuery_inner.t_data_components>) => {
  // map over and filter out the data from poly variants
  let comps = list->Js.Array2.map(x =>
    switch x {
    | #ComponentBlogRecord(data) => Some(data)
    | _ => None
    }
  )

  let stuff = Belt.Array.map(comps, comp => {
    switch comp {
    | Some(c) =>
      <div key={Belt.Option.getWithDefault(c.title, "")}>
        <h3> {c.title->filterOption} </h3>
        <div> {c.postDate->Belt.Option.getExn->Js.Json.stringify->React.string} </div>
      </div>
    | None => ""->React.string
    }
  })

  open ListStyles
  <div className={ListStyle.listItem}> {stuff->React.array} </div>
}
