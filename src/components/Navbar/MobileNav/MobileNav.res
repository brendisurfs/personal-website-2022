module MapIcon = {
  @react.component @module("publi/map.js")
  external make: (~ref: ReactDOM.domRef=?, ~children: React.element=?, {.}) => React.element =
    "MapIcon"
}

let mapIcon = <MapIcon />

module MobileNav = {
  @react.component
  let make = () => {
    <nav> mapIcon </nav>
  }
}
