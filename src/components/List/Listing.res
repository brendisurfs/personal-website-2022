open Queries
open ListStyles
open FilterOption

// listing component for writings home page, not detail.
@react.component
let make = (~val: PageQuery.PageQuery_inner.t_data) => {
  let list = val.components
  let pageSubhead = Belt.Option.getExn(val.pageSubtitle)
  let subheadValue = pageSubhead

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

  let writingDisplay = Belt.Array.map(comps, comp => {
    switch comp {
    | Some(c) =>
      let postDate = c.postDate->Belt.Option.getExn
      let jsonPostDate = postDate->Js.Json.stringify
      let tags = Belt.Array.map(c.tags, tag => {
        let tagTitle = Belt.Option.getWithDefault(tag.tagTitle, "")->Js.String2.replace(" ", "-")
        let fmtTag = `#${tagTitle}`
        fmtTag
      })

      let tagColor = ReactDOM.Style.make(~color="orange", ())
      let tagsDomElements = Belt.Array.map(tags, tag =>
        <div style={tagColor} key={tag}> {tag->React.string} </div>
      )

      // formatted by taking away quotes.
      let formattedPostDate = Js.String2.replaceByRe(jsonPostDate, %re(`/"/g`), "")->React.string

      // -- view
      <div key={postDate->Js.String2.make} className={ListStyle.blogItemWrapper}>
        <div
          className={ListStyle.listItem}
          key={Belt.Option.getExn(c.slug)}
          onClick={x => handleClickBlogTitle(x, c.slug)}>
          <h3 style={ReactDOM.Style.make(~margin="0", ())}> {c.title->filterOption} </h3>
          <div> {formattedPostDate} </div>
        </div>
        <div className={`tag-list ${ListStyle.tagContainer}`}> {tagsDomElements->React.array} </div>
        <div className={ListStyle.bottomBorder} />
      </div>

    | None => ""->React.string
    }
  })

  <div className={ListStyle.container}>
    <div className="all-tags" />
    <h2
      className="subhead"
      style={ReactDOM.Style.make(~color="white", ~padding="2rem", ~maxWidth="75%", ())}>
      {subheadValue->React.string}
    </h2>
    <div className={`list-items ${ListStyle.listItemsContainer}`}>
      {writingDisplay->React.array}
    </div>
  </div>
}
