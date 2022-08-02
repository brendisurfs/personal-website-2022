open Layout

module HomeQuery = %graphql(`
  query HomeQuery {
    allComponentProjects {
      id
      title
    }
  }
`)

@react.component
let make = () => {
  // -- data

  // -- view
  open React
  <Layout> <div> {"Home page"->string} </div> </Layout>
}
