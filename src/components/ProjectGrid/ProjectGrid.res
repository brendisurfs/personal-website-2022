open Queries

@react.component
let make = (~projects: array<HomeQuery.HomeQuery_inner.t_projects>) => {
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
