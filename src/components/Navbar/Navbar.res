open Belt
open ChangeUrl
open NavbarStyles

type splitOp = Greater | Less

module DotIcon = {
  @react.component
  let make = (~menuItems) => {
    let (isOpen, setIsOpen) = React.useState(_ => false)

    // this is gross but oh well.
    let changeIfOpened = %raw(`
    function changeDomStyle(isOpened) {
      let {body} = document;
      if (isOpened) {
        body.style.overflow = "hidden";
        console.log(body.style.overflow)
      } else {
        body.style.overflowX = "hiden";
        body.style.overflowY = "";
        console.log(body.style.overflow)
      }
    }
    `)
    // use effect to listen and modify scrolling for the menu
    React.useEffect1(() => {
      let _ = changeIfOpened(isOpen)
      None
    }, [isOpen])

    let handleClick = () => {
      setIsOpen(_prev => !isOpen)
    }

    open WebBindings
    let menuButtonValue =
      Document.document->Document.getElementById("menu-dot-icon")->Js.Option.getExn

    // handles a click outside the mobile menu so that it will still close.
    let fnHandleClickOutside = (evt: WebBindings.eventType) => {
      let eventTarget = evt.target
      if eventTarget != menuButtonValue && isOpen {
        setIsOpen(_prev => false)
      }
    }

    let _ = WebBindings.Window.addWindowEventListener("mouseup", fnHandleClickOutside)

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

      // NOTE: because its harder to pass in dynamic values into our css,
      // We just use inline styles.
      <div
        id="menu-popover"
        className={MVStyle.menuDropdown}
        style={ReactDOM.Style.make(
          ~top=posPercent,
          ~transition="top 0.35s ease-in-out",
          ~zIndex="100",
          (),
        )}>
        mobileItems
      </div>
    }

    // -- view
    <div className="menu-btn" style={ReactDOM.Style.make(~overflow="hidden", ())}>
      <div className={Nav.boxButton} onClick={_e => handleClick()} /> mobileMenuPopoverItem
    </div>
  }
}

@react.component
let make = (~topbarList) => {
  let changeToHome = () => {
    changeUrl("home")
  }

  <nav
    className={Nav.container} style={ReactDOM.Style.make(~zIndex="999", ~background="black", ())}>
    <div className={Nav.innerWrapper}>
      <div className={Nav.title} onClick={_e => changeToHome()}>
        <h1> {"Brendancreates"->React.string} </h1>
      </div>
      <DotIcon menuItems={topbarList} />
    </div>
  </nav>
}
