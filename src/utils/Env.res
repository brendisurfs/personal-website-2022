/* type env = { */
/* @as("VITE_API_DATO") */
/* datoEnv: string, */
/* } */
/* @val @scope("process") external env: env = "env" */
// @val @scope(("process", "env")) @return(nullable) external datoKey: option<string> = "VITE_API_DATO"

let nodeEnv = Node.Process.process["env"]

let env = name => {
  switch Js.Dict.get(nodeEnv, name) {
  | Some(value) => Ok(value)
  | None => Error(`env variable ${name} cannot be loaded`)
  }
}
