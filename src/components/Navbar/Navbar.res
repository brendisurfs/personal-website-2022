let changeUrl = url => {
  RescriptReactRouter.push(url)
}

type splitOp = Greater | Less

let splitArrayByLen = (arr, splitOp) => {
  let arrayLen = Array.length(arr)
  switch splitOp {
  | Greater => arr->Js.Array2.filteri((_, idx) => idx >= arrayLen / 2)
  | Less => arr->Js.Array2.filteri((_, idx) => idx < arrayLen / 2)
  }
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
  let createNavItems = arr => {
    Belt.Array.map(arr, l => {
      <div className={Nav.button} onClick={_e => changeUrl(l)} key={l}> {l->React.string} </div>
    })
  }

  let leftSide = splitArrayByLen(topbarList, Less)->createNavItems
  let rightSide = splitArrayByLen(topbarList, Greater)->createNavItems

  let navItems = Belt.Array.map(topbarList, l => {
    <div className={Nav.button} onClick={_e => changeUrl(l)} key={l}> {l->React.string} </div>
  })

  <nav className={Nav.container}>
    <div className={Nav.innerWrapper}>
      <div className={Nav.buttonWrapper}> {React.array(leftSide)} </div>
      <div className={Nav.title} onClick={_e => changeUrl("home")}>
        <h1> {"Brendancreates"->React.string} </h1>
        {"|"->React.string}
        <div> {currentPath->React.string} </div>
      </div>
      <div className={Nav.buttonWrapper}> {React.array(rightSide)} </div>
    </div>
  </nav>
}
