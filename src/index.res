open App


switch ReactDOM.querySelector("#root") {
| Some(root) => ReactDOM.render(
  <ApolloClient.React.ApolloProvider client=Apollo.client>
    <App />
  </ApolloClient.React.ApolloProvider>
, root)
| None => ()
}
