@module("./ThreeRenderer.js") external renderTarget: unit => unit = "renderTarget"
@module("./ThreeRenderer.js") external renderCanvas: unit => Dom.element = "renderCanvas"

module WebApi = {
  module Element = {
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

  open StylesThreeCanvas
  <div className={CanvasStyles.container} ref={ReactDOM.Ref.domRef(canvas)} />
}
