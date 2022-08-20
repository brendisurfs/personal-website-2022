open MobileNavStyles

@react.component
let make = (~isOpen: bool, ~menuItems: array<string>) => {
  let posPercent = switch isOpen {
  | true => "0%"
  | false => "-50%"
  }

  let mobileItems = Js.Array2.map(menuItems, item => {
    let comp = <div key=item> {item->React.string} </div>
    comp
  })->React.array

  <div
    className={MVStyle.menuDropdown}
    style={ReactDOM.Style.make(~right=posPercent, ~transition="right 0.5s ease-in-out", ())}>
    {"menu"->React.string} mobileItems
  </div>
}
