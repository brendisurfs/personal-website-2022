module Canvas = {
  @react.component @module("@react-three/fiber")
  external make: (~children: option<React.element>=?) => React.element = "Canvas"
}

@react.component
let make = () => {
  // dom ref

  <div className="canvas-wrapper"> <Canvas /> </div>
}
