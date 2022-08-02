open App
open Apollo

switch ReactDOM.querySelector("#root") {
| Some(root) =>
  ReactDOM.render(
    <ApolloClient.React.ApolloProvider client={client}>
      <App />
    </ApolloClient.React.ApolloProvider>,
    root,
  )
| None => ()
}
