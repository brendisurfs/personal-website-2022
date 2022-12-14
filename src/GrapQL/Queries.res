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
      components {
        ...on ComponentBlogRecord {
          tags {
            id
            tagTitle
          }
          title
          postDate
          slug
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
      blocks {
        id
        img {
          url
          blurhash
        }
      }
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

module ProjectDetailQuery = %graphql(`
query ProjectDetailQuery($slug: String!) {
	componentProjectDetail(filter:{slug:{eq: $slug}}) {
    id
    title
    projectLinks {
      id
      linkName
      linkUrl
    }
    description {
      id
      reverse
      text
      switchbackImage {
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
