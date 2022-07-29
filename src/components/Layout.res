module Layout = {
  @react.component
  let make = (~children: React.element) => {
    // -- init

    // -- view
    <div> <Navbar /> children </div>
  }
}
