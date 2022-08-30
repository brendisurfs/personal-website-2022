open WebApi
open MobileNavStyles

module MapIcon = {
  @react.component
  let make = (~menuItems) => {
    let (isOpen, setIsOpen) = React.useState(_ => false)

    let handleClick = () => {
      setIsOpen(_prev => !isOpen)
    }

    // ref to the mobile menu, to close it if we click outside of it.
    let menuRef = React.useRef(Js.Nullable.null)
    // handles a click outside the mobile menu so that it will still close.
    let fnHandleClickOutside = (evt: WebApi.eventType) => {
      let eventTarget = evt.target
      let document = Document.document
      let menuTarget = Document.getElementById(document, "mobile-menu-popover")
      let menuMapButtonTarget = Document.getElementById(document, "mobile-menu-map-icon")
      let menuTargetValue = Js.Option.getExn(menuTarget)
      let menuButtonValue = Js.Option.getExn(menuMapButtonTarget)

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
      let mobileItems = Js.Array2.map(menuItems, item => {
        let comp = <div className={MVStyle.menuDropownButton} key=item> {item->React.string} </div>
        comp
      })->React.array

      <div
        id="mobile-menu-popover"
        className={MVStyle.menuDropdown}
        style={ReactDOM.Style.make(~top=posPercent, ~transition="top 0.75s ease-in-out", ())}>
        {"menu"->React.string} mobileItems
      </div>
    }

    // -- view
    <div style={ReactDOM.Style.make(~overflow="hidden", ())}>
      <svg
        id="mobile-menu-map-icon"
        className={MVStyle.mobileMenuBtn}
        onClick={_ => handleClick()}
        xmlns="http://www.w3.org/2000/svg"
        width="24"
        height="24"
        fill="none"
        stroke="white"
        strokeWidth="1"
        viewBox="0 0 24 24"
        strokeLinecap="round"
        strokeLinejoin="round">
        <polygon points="1 6 1 22 8 18 16 22 23 18 23 2 16 6 8 2 1 6" />
        <line x1="8" y1="2" x2="8" y2="18" />
        <line x1="16" y1="6" x2="16" y2="22" />
      </svg>
      // add ref here to close the window if we click outside of it
      mobileMenuPopoverItem
      // <MobileMenu isOpen menuItems />
    </div>
  }
}

module MobileNav = {
  @react.component
  let make = (~menuItems: array<string>) => {
    let myName = "brendancreates"->React.string

    <nav className={MVStyle.container}>
      <div className={MVStyle.mobileTitle}> myName </div> <MapIcon menuItems />
    </nav>
  }
}
