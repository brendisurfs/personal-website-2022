@module("./ThreeRenderer.js") external renderTarget: unit => unit = "renderTarget"
@module("./ThreeRenderer.js") external renderCanvas: unit => Dom.element = "renderCanvas"

module LargeDiv = {
  @react.component
  let make = () => {
    let divStyle = ReactDOM.Style.make(
      ~color="white",
      ~minHeight="50vh",
      ~textAlign="center",
      ~alignItems="center",
      ~justifyContent="center",
      (),
    )
    <div style={divStyle}> {""->React.string} </div>
  }
}

@react.component
let make = () => {
  let canvas = React.useRef(Js.Nullable.null)

  open WebBindings
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
  <div>
    <div className={CanvasStyles.container} ref={ReactDOM.Ref.domRef(canvas)} />
    <LargeDiv />
    <LargeDiv />
    <LargeDiv />
    <LargeDiv />
  </div>
}
