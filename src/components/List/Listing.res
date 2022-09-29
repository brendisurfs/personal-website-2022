open Queries
open ListStyles
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

  // function to handle clicking on the blog detail.
  let handleClickBlogTitle: (ReactEvent.Mouse.t, option<string>) => unit = (_target, slug) => {
    switch slug {
    | Some(sluggy) => RescriptReactRouter.push(`/writing/${sluggy}`)
    | None => ()
    }
  }
  /* module IntCmp = Belt.Id.MakeComparable({ */
  /* type t = string */
  /* let cmp = Pervasives.compare */
  /* }) */
  /* let totalTags = Belt.Set.make(~id=module(IntCmp)) */

  let writingDisplay = Belt.Array.map(comps, comp => {
    switch comp {
    | Some(c) =>
      let postDate = c.postDate->Belt.Option.getExn
      let jsonPostDate = postDate->Js.Json.stringify
      let tags = Belt.Array.map(c.tags, tag => tag.tagTitle->Belt.Option.getWithDefault(""))
      let tagsDomElements = Belt.Array.map(tags, tag => <div> {tag->React.string} </div>)
      /* Belt.Array.forEach(tags, tag => { */
      /* let _ = Belt.Set.add(totalTags, tag) */
      /* }) */

      // formatted by taking away quotes.
      let formattedPostDate = Js.String2.replaceByRe(jsonPostDate, %re(`/"/g`), "")->React.string
      <div key={postDate->Js.String2.make}>
        <div
          className={ListStyle.listItem}
          key={Belt.Option.getWithDefault(c.slug, "")}
          onClick={x => handleClickBlogTitle(x, c.slug)}>
          <h3> {c.title->filterOption} </h3> <div> {formattedPostDate} </div>
        </div>
        <div className="bottom-border" />
      </div>
    | None => ""->React.string
    }
  })

  <div className={ListStyle.container}>
    <div className="all-tags" /> <div className="list-items"> {writingDisplay->React.array} </div>
  </div>
}
