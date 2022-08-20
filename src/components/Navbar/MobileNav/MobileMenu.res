open MobileNavStyles

@react.component
let make = (~isOpen: bool) => {
  let posPercent = switch isOpen {
  | true => "0%"
  | false => "-50%"
  }

  <div
    className={MVStyle.menuDropdown}
    style={ReactDOM.Style.make(~right=posPercent, ~transition="right 0.5s ease-in-out", ())}>
    {"menuuuu"->React.string}
  </div>
}
