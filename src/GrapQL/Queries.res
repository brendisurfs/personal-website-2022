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
        responsiveImage(imgixParams: {w: 240, h: 240, fit: crop}) {
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
