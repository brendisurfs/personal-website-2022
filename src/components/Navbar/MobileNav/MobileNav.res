open WebApi.Window
open MobileNavStyles

module MapIcon = {
  @react.component
  let make = (~menuItems) => {
    let (isOpen, setIsOpen) = React.useState(_ => false)
    // ref to the mobile menu, to close it if we click outside of it.
    let menuRef = React.useRef(Js.Nullable.null)

    let handleClick = () => {
      setIsOpen(_prev => !isOpen)
    }

    // mobileMenu - popover mobile menu

    @react.component
    let mobileMenu = {
      let posPercent = switch isOpen {
      | true => "0%"
      | false => "-100%"
      }

      // mobile menu items that get turned into react array.
      let mobileItems = Js.Array2.map(menuItems, item => {
        let comp = <div key=item> {item->React.string} </div>
        comp
      })->React.array

      <div
        className={MVStyle.menuDropdown}
        style={ReactDOM.Style.make(
          ~top=posPercent,
          ~display=isOpen ? "" : "hidden",
          ~transition="top 0.5s ease-in-out",
          (),
        )}>
        {"menu"->React.string} mobileItems
      </div>
    }

    <div style={ReactDOM.Style.make(~overflow="hidden", ())}>
      <svg
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
      mobileMenu
      // <MobileMenu isOpen menuItems />
    </div>
  }
}

module MobileNav = {
  @react.component
  let make = (~menuItems: array<string>) => {
    let name = "brendancreates"->React.string

    <nav className={MVStyle.container}>
      <div className={MVStyle.mobileTitle}> name </div> <MapIcon menuItems />
    </nav>
  }
}
