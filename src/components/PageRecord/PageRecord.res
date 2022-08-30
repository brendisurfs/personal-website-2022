open Queries
open FilterOption

@react.component
let make = (~data: PageQuery.PageQuery_inner.t_data) => {
  // -- data
  open DatoParser
  let bodyText = render(data.pageText->Belt.Option.getExn)
  // -- view
  open PageRecordStyles
  <div className={PageStyle.container}>
    <div className={PageStyle.wrapper}>
      <h2> {data.pageTitle->filterOption} </h2>
      // NOTE: THIS MUST BE REPLACED BEFORE PROD
      <div dangerouslySetInnerHTML={"__html": bodyText} />
    </div>
  </div>
}
