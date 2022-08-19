module MapIcon = {
  @react.component
  let make = () => {
    <svg
      xmlns="http://www.w3.org/2000/svg"
      width="24"
      height="24"
      viewBox="0 0 24 24"
      fill="none"
      stroke="white"
      strokeWidth="1"
      strokeLinecap="round"
      strokeLinejoin="round"
      className="feather feather-map">
      <polygon points="1 6 1 22 8 18 16 22 23 18 23 2 16 6 8 2 1 6" />
      <line x1="8" y1="2" x2="8" y2="18" />
      <line x1="16" y1="6" x2="16" y2="22" />
    </svg>
  }
}

open MobileNavStyles

module MobileNav = {
  @react.component
  let make = () => {
    <nav className={MobileNavStyle.container}> <MapIcon /> </nav>
  }
}
