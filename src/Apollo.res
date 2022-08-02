open ApolloClient

/* let headers = { */
/* "Authorization": `Bearer ${datoKey}`, */
/* } */

let client = {
  make(
    ~cache=Cache.InMemoryCache.make(),
    ~connectToDevTools=true,
    ~uri=_ => "https://graphql.datocms.com/",
    // ~headers=Obj.magic(headers),
    (),
  )
}
