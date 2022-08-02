open Layout

/* module HomeQuery = %graphql(` */
/* query HomeQuery { */
/* allComponentProjects { */
/* id */
/* title */
/* } */
/* } */
/* `) */
let rawDatoEnv = %raw(`import.meta.env["VITE_API_DATO"]`)

@react.component
let make = () => {
  // -- data

  // -- view
  open React
  <Layout> <div> {"Home page"->string} </div> </Layout>
}
