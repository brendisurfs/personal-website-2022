module HomeQuery = %graphql(`
  query HomeQuery {
    projects: allComponentProjects {
      id
      title
      description
    }
  }
`)
