open Queries

type project = HomeQuery.t_projects

/* module ProjectCard = { */
/* @react.component */
/* let make = (~project) => { */
/*  */
/* } */
/* } */

@react.component
let make = (~projects: array<project>) => {
  let filterProjectOption = project => {
    switch project {
    | Some(p) => p->React.string
    | None => ""->React.string
    }
  }

  // -- view
  <div>
    {projects
    ->Belt.Array.map(project =>
      <div>
        <h2> {project.title->filterProjectOption} </h2>
        <p> {project.description->filterProjectOption} </p>
      </div>
    )
    ->React.array}
  </div>
}
