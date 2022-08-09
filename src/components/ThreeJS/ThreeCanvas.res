module Canvas = {
  @react.component @module("@react-three/fiber")
  external make: (~children: option<React.element>=?) => React.element = "Canvas"
}

/* @react.component */
/* let make = () => { */
/* // dom ref */
/* <div /> */
/* } */

@module("../ThreeJS/TestingThree") external renderThree: unit => unit = "renderThree"

@react.component
let make = () => {
  let _ = renderThree()
  <div> {"three canvas maker"->React.string} </div>
}
