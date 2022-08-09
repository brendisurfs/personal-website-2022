open WebApi.Window

@react.component
let make = () => {
  switch true {
  | true if useViewport() > 780 => <Navbar />
  | _ => <MobileNav />
  }
}
