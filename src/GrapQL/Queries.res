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

/* module AboutQuery = %graphql(` */
/* query AboutQuery { */
/* about: */
/* } */
/*  */
/* `) */
