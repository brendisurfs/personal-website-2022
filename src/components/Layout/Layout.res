open LayoutStyles
module Layout = {
  @react.component
  let make = (~children: React.element) => {
    // -- init

    // -- view
    <div className={layoutContainer}> <Navbar /> children <Footer /> </div>
  }
}
