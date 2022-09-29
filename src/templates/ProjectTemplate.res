@react.component
let make = (~slug) => {
  let innerDetail = slug
  Js.log(slug)
  <div> {"this is a component"->React.string} </div>
}
