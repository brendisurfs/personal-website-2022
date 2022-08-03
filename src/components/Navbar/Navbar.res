let changeUrl = url => {
  RescriptReactRouter.push(url)
}

@react.component
let make = () => {
  let topbarList = ["home", "projects", "about", "writing"]

  open NavbarStyles
  let navItems = Belt.Array.map(topbarList, l => {
    <button className={navButton} onClick={_e => changeUrl(l)} key={l}> {l->React.string} </button>
  })

  <nav className={navbarContainer}>
    <h1 className={navTitleStyle} onClick={_e => changeUrl("home")}>
      {"Brendancreates"->React.string}
    </h1>
    <div className={navButtonWrapper}> {React.array(navItems)} </div>
  </nav>
}
