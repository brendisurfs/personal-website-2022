@module("./testing_three.js") external renderer: 'renderType = "renderer"

// NOTE: taken from ryyppy in forums
module Element = {
  @send external appendChild: (Dom.element, Dom.element) => Dom.element = "appendChild"
}

module Document = {
  @val external document: Dom.document = "document"
  @get external body: Dom.document => Dom.element = "body"
}

@react.component
let make = () => {
  // dom ref
  let canvasFromThree: Js.nullable<Dom.element> = renderer["domElement"]
  let canvasRef = React.useRef(canvasFromThree)
  // append renderer canvas to element

  <canvas id="three-canvas" ref={ReactDOM.Ref.domRef(canvasRef)} />
}
