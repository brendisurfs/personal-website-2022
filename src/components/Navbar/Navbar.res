let changeUrl = url => {
  RescriptReactRouter.push(url)
}

@react.component
let make = () => {
  let topbarList = ["home", "projects", "writing", "about"]

  let url = RescriptReactRouter.useUrl()
  let currentPath = switch url.path->Belt.List.head {
  | Some(path) => path
  | None => "home"
  }

  open NavbarStyles
  let arrayLen = Array.length(topbarList)
  let leftSide = topbarList->Js.Array2.filteri((_, idx) => idx < arrayLen / 2)
  Js.log(leftSide)
  let navItems = Belt.Array.map(topbarList, l => {
    <div className={Nav.button} onClick={_e => changeUrl(l)} key={l}> {l->React.string} </div>
  })

  <nav className={Nav.container}>
    <div className={Nav.title} onClick={_e => changeUrl("home")}>
      <h1> {"Brendancreates"->React.string} </h1>
      {"|"->React.string}
      <div> {currentPath->React.string} </div>
    </div>
    <div className={Nav.buttonWrapper}> {React.array(navItems)} </div>
  </nav>
}
