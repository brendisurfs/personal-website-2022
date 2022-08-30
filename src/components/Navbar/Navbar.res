open ChangeUrl
type splitOp = Greater | Less

let splitArrayByLen = (arr, splitOp) => {
  let arrayLen = Array.length(arr)
  switch splitOp {
  | Greater => arr->Js.Array2.filteri((_, idx) => idx >= arrayLen / 2)
  | Less => arr->Js.Array2.filteri((_, idx) => idx < arrayLen / 2)
  }
}

@react.component
let make = (~topbarList) => {
  open NavbarStyles
  let createNavItems = arr => {
    Belt.Array.map(arr, l => {
      <div className={Nav.button} onClick={_e => changeUrl(l)} key={l}> {l->React.string} </div>
    })
  }

  // left and right side of the navbar
  let leftSide = splitArrayByLen(topbarList, Less)->createNavItems
  let rightSide = splitArrayByLen(topbarList, Greater)->createNavItems

  <nav
    className={Nav.container} style={ReactDOM.Style.make(~zIndex="999", ~background="black", ())}>
    <div className={Nav.innerWrapper}>
      <div className={Nav.buttonWrapper}> {React.array(leftSide)} </div>
      <div className={Nav.title} onClick={_e => changeUrl("home")}>
        <h1> {"Brendancreates"->React.string} </h1>
      </div>
      <div className={Nav.buttonWrapper}> {React.array(rightSide)} </div>
    </div>
  </nav>
}
