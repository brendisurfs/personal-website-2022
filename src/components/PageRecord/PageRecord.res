open Queries
open FilterOption

@react.component
let make = (~data: AboutQuery.AboutQuery_inner.t_about) => {
  // -- data
  open DatoParser
  let bodyText = render(data.pageText)

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
