open LayoutStyles

module Layout = {
  @react.component
  let make = (~children: React.element) => {
    <div className={layoutContainer}> <Navbar /> children <Footer /> </div>
  }
}
