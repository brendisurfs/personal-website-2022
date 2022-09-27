open LayoutStyles

module Layout = {
  @react.component
  let make = (~children: React.element) => {
    <div className={layoutContainer}> <NavbarSwitcher /> children </div>
  }
}
