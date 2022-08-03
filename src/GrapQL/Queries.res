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

module ProjectsQuery = %graphql(`
query ProjectsQuery {
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
  	about: page(filter:{internalName:{eq:"About Page"}}) {
    pageTitle
    pageSubtitle
    pageText {
			value
    }
  }
}
`)
