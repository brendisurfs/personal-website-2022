open Env
open ApolloClient

let headers = {
  "Authorization": `Bearer ${rawDatoEnv}`,
}

let client = {
  make(
    ~cache=Cache.InMemoryCache.make(),
    ~connectToDevTools=true,
    ~uri=_ => "https://graphql.datocms.com/",
    ~headers=Obj.magic(headers),
    (),
  )
}
