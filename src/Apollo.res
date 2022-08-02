open ApolloClient

@val @scope(("process", "env")) external datoKey: string = "DATO_FULL_ACCESS"

Js.log(datoKey)
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
