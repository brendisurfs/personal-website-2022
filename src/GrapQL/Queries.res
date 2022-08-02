module HomeQuery = %graphql(`
query HomeQuery {
  allComponentProjectLists {
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
