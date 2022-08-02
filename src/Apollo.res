open ApolloClient

let nodeEnv = Node.Process.process["env"]
let getEnv = name =>
  switch Js.Dict.get(nodeEnv, name) {
  | Some(value) => Ok(value)
  | None => Error(`env variable ${name} not found`)
  }

let datoKey = getEnv("DATO_FULL_ACCESS")->Belt.Result.getExn
let headers = {
  "Authorization": `Bearer ${datoKey}`,
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
