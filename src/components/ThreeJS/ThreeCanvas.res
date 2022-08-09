module Canvas = {
  @react.component @module("@react-three/fiber")
  external make: (~children: option<React.element>=?) => React.element = "Canvas"
}

/* @react.component */
/* let make = () => { */
/* // dom ref */
/* <div /> */
/* } */

@module("./TestingThree.js") external renderThree: unit => unit = "renderThree"

@react.component
let make = () => {
  renderThree()
  <div id="target-canvas"> {"three canvas maker"->React.string} </div>
}
