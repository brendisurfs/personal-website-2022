let changeUrl = url => {
  RescriptReactRouter.push(url)
}

@react.component
let make = () => {
  let topbarList = ["home", "about", "writing"]

  let navItems = Belt.Array.map(topbarList, l => {
    <button onClick={_e => changeUrl(l)} key={l}> {l->React.string} </button>
  })
  <nav> {React.array(navItems)} </nav>
}
