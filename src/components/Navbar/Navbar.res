open WebApi
open ChangeUrl

type splitOp = Greater | Less

let splitArrayByLen = (arr, splitOp) => {
  let arrayLen = Array.length(arr)
  switch splitOp {
  | Greater => arr->Js.Array2.filteri((_, idx) => idx >= arrayLen / 2)
  | Less => arr->Js.Array2.filteri((_, idx) => idx < arrayLen / 2)
  }
}

@react.component
let make = (~topbarList) => {
  open NavbarStyles
  let createNavItems = arr => {
    Belt.Array.map(arr, l => {
      <div className={Nav.button} onClick={_e => changeUrl(l)} key={l}> {l->React.string} </div>
    })
  }

  let (isOpen, setIsOpen) = React.useState(_ => false)

  let handleClick = () => {
    setIsOpen(_prev => !isOpen)
  }

  let menuButtonValue =
    Document.document->Document.getElementById("mobile-menu-map-icon")->Js.Option.getExn

  // handles a click outside the mobile menu so that it will still close.
  let fnHandleClickOutside = (evt: WebApi.eventType) => {
    let eventTarget = evt.target
    if eventTarget != menuButtonValue && isOpen {
      setIsOpen(_prev => false)
    }
  }

  let _ = WebApi.Window.addWindowEventListener("mouseup", fnHandleClickOutside)

  @react.component
  let mobileMenuPopoverItem = {
    let posPercent = switch isOpen {
    | true => "0%"
    | false => "-100%"
    }

    // mobile menu items that get turned into react array.
    open MobileNavStyles
    let mobileItems = Js.Array2.map(topbarList, item => {
      let comp =
        <div className={MVStyle.menuDropownButton} onClick={_e => changeUrl(item)} key=item>
          {item->React.string}
        </div>
      comp
    })->React.array

    <div
      id="mobile-menu-popover"
      className={MVStyle.menuDropdown}
      style={ReactDOM.Style.make(
        ~top=posPercent,
        ~transition="top 0.75s ease-in-out",
        ~zIndex="100",
        (),
      )}>
      mobileItems
    </div>
  }

  <nav
    className={Nav.container} style={ReactDOM.Style.make(~zIndex="999", ~background="black", ())}>
    <div className={Nav.innerWrapper}>
      <div className={Nav.title} onClick={_e => changeUrl("home")}>
        <h1> {"Brendancreates"->React.string} </h1>
      </div>
      // THIS IS WHERE THE DOT WILL GO
      /* <div className={Nav.buttonWrapper}> {React.array(createNavItems(topbarList))} </div> */
      <div className={Nav.boxButton} />
    </div>
  </nav>
}
