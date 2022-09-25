open WebApi
open ChangeUrl
open NavbarStyles

type splitOp = Greater | Less

module DotIcon = {
  @react.component
  let make = (~menuItems) => {
    let (isOpen, setIsOpen) = React.useState(_ => false)

    let handleClick = () => {
      setIsOpen(_prev => !isOpen)
    }

    let menuButtonValue =
      Document.document->Document.getElementById("menu-dot-icon")->Js.Option.getExn

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
      let mobileItems = Js.Array2.map(menuItems, item => {
        let comp =
          <div className={MVStyle.menuDropownButton} onClick={_e => changeUrl(item)} key=item>
            {item->React.string}
          </div>
        comp
      })->React.array

      <div
        id="menu-popover"
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

    // -- view
    <div style={ReactDOM.Style.make(~overflow="hidden", ())}>
      <div className={Nav.boxButton} onClick={_e => handleClick()} /> mobileMenuPopoverItem
    </div>
  }
}

@react.component
let make = (~topbarList) => {
  <nav
    className={Nav.container} style={ReactDOM.Style.make(~zIndex="999", ~background="black", ())}>
    <div className={Nav.innerWrapper}>
      <div className={Nav.title} onClick={_e => changeUrl("home")}>
        <h1> {"Brendancreates"->React.string} </h1>
      </div>
      // DOT ICON HERE
      <DotIcon menuItems={topbarList} />
    </div>
  </nav>
}
