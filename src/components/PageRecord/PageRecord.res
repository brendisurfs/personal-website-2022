open Queries
open FilterOption

@react.component
let make = (~data: AboutQuery.AboutQuery_inner.t_about) => {
  Js.log(data.pageText)
  <div>
    <h2> {data.pageTitle->filterProjectOption} </h2>
    <p> {data.pageSubtitle->filterProjectOption} </p>
  </div>
}
