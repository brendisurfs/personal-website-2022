@module("./TestingThree.js") external renderTarget: unit => unit = "renderTarget"
@module("./TestingThree.js") external renderCanvas: unit => Dom.element = "renderCanvas"
// find the target using ref.

module WebApi = {
  module Element = {
    // append child for renderer canvas.
    @send external appendChild: (Dom.element, Dom.element) => unit = "appendChild"
  }

  module Document = {
    @val external document: Dom.element = "document"
    @get external body: Dom.element => Dom.element = "body"
    @send external getElementById: (Dom.element, string) => option<Dom.element> = "getElementById"
  }
}

@react.component
let make = () => {
  // I want to make this a nullable Dom element
  let canvas = React.useRef(Js.Nullable.null)

  open WebApi
  React.useEffect(_ => {
    let innerCanvas = canvas.current->Js.Nullable.toOption
    switch innerCanvas {
    | Some(val) => {
        let renderCanvas = renderCanvas()
        let _ = Element.appendChild(val, renderCanvas)
        renderTarget()
      }
    | None => ()
    }
    None
  })

  <div ref={ReactDOM.Ref.domRef(canvas)}>
    {"three canvas maker"->React.string} <div id="target-canvas" />
  </div>
}
