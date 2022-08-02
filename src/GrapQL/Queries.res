module HomeQuery = %graphql(`
query HomeQuery {
  workProjects: allComponentProjectLists {
    id
    projectType
    projects {
      id
      title
      description
    }
  }
}

`)

module AboutQuery = %graphql(`
query AboutPageQuery {
    allPages(filter:{internalName:{eq:"About Page"}}) {
    pageTitle
    pageSubtitle
    pageText {
			value
    }
  }
}
`)
