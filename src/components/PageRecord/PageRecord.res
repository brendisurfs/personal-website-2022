open Queries
open FilterOption

@react.component
let make = (~data: PageQuery.PageQuery_inner.t_data) => {
  // -- data
  open DatoParser
  let bodyText = render(data.pageText->Belt.Option.getExn, ())
  // -- view
  open PageRecordStyles
  <div className={PageStyle.container}>
    <div className={PageStyle.wrapper}>
      <h2 className={PageStyle.title}> {data.pageTitle->filterOption} </h2>
      <div className={PageStyle.bodyText} dangerouslySetInnerHTML={"__html": bodyText} />
    </div>
  </div>
}
