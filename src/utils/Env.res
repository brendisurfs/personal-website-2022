/* type env = { */
/* @as("VITE_API_DATO") */
/* datoEnv: string, */
/* } */
/* @val @scope("process") external env: env = "env" */
// @val @scope(("process", "env")) @return(nullable) external datoKey: option<string> = "VITE_API_DATO"

let rawDatoEnv = %raw(`import.meta.env["VITE_API_DATO"]`)
