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

module PageQuery = %graphql(`
  query PageQuery($pageSlug: String!) {
  	data: page(filter:{internalName:{eq: $pageSlug}}) {
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
