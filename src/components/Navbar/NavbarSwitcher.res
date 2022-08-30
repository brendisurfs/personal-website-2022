open WebApi.Window
open MobileNav

@react.component
let make = () => {
  let topbarList = ["home", "projects", "writing", "about"]
  switch true {
  | true if useViewport() > 780 => <Navbar topbarList />
  | _ => <MobileNav menuItems=topbarList />
  }
}
