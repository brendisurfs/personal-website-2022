open App
open ReScriptUrql

let client = Client.make(~url="https://graphql.datocms.com/", ())

let appWithContext = root => {
  ReactDOM.render(<Context.Provider value=client> <App /> </Context.Provider>, root)
}

switch ReactDOM.querySelector("#root") {
| Some(root) => appWithContext(root)
| None => ()
}
