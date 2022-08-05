let changeUrl = url => {
  RescriptReactRouter.push(url)
}

@react.component
let make = () => {
  let topbarList = ["home", "projects", "about", "writing"]

  let url = RescriptReactRouter.useUrl()
  let currentPath = url.path->List.hd

  open NavbarStyles
  let navItems = Belt.Array.map(topbarList, l => {
    <button className={navButton} onClick={_e => changeUrl(l)} key={l}> {l->React.string} </button>
  })

  <nav className={navbarContainer}>
    <div className={navTitleStyle} onClick={_e => changeUrl("home")}>
      <h1> {"Brendancreates"->React.string} </h1>
      {"|"->React.string}
      <div> {currentPath->React.string} </div>
    </div>
    <div className={navButtonWrapper}> {React.array(navItems)} </div>
  </nav>
}
