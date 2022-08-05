// TODO: this needs to be modified.
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

// NOTE: THIS SHOULD BE CONVERTED TO A MORE GENERIC QUERY FOR DRY PRINCIPLE
module PageQuery = %graphql(`
  query PageQuery($pageSlug: String!) {
  	writing: allPages(filter:{internalName:{eq: $pageSlug}}) {
      pageTitle
      pageSubtitle
      pageText {
        value
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
      projectImage {
        id
        responsiveImage {
          alt
          src
          base64
          bgColor
          title
        }
      }
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
