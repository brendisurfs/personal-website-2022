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
      pageText {
        value
      }
      components {
        ...on ComponentBlogRecord {
          title
          postDate
        }
      }
  }
}
`)

module BlogDetailQuery = %graphql(`
query BlogDetailQuery($blogSlug: String!) {
  componentBlog(filter: {slug: {eq: $blogSlug}}) {
    title
    postDate
    tags {
      id
      tagTitle
    }
    body {
      value
      links
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
