module Element = {
  @send external appendChild: (Dom.element, Dom.element) => unit = "appendChild"
}

module Document = {
  @val external document: Dom.element = "document"
  @get external body: Dom.element => Dom.element = "body"
  @send external getElementById: (Dom.element, string) => option<Dom.element> = "getElementById"
}

module Window = {
  @scope("window") @val
  external windowInnerWidth: int = "innerWidth"

  @scope("window") @val
  external addWindowEventListener: (string, unit => unit) => unit = "addEventListener"

  @scope("window") @val
  external removeWindowEventListener: (string, unit => unit) => unit = "removeEventListener"

  @genType
  let useViewport = () => {
    let (width, setWidth) = React.useState(_ => windowInnerWidth)
    React.useEffect0(() => {
      let handleResize = () => setWidth(_ => windowInnerWidth)
      addWindowEventListener("resize", handleResize)

      Some(() => removeWindowEventListener("resize", handleResize))
    })
    width
  }
}
