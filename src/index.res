open App
open ReScriptUrql

let client = Client.make(~url="https://graphql.datocms.com/", ())

switch ReactDOM.querySelector("#root") {
| Some(root) => ReactDOM.render(<Context.Provider value=client> <App /> </Context.Provider>, root)
| None => ()
}
