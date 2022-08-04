open Queries
open FilterOption
open ProjectCardStyles

type projectType = ProjectsQuery.ProjectsQuery_inner.t_workProjects_projects

@react.component
let make = (~project: projectType) => {
  <div className=Card.cardContainer>
    <h2> {project.title->filterOption} </h2>
    <div className=Card.description> {project.description->filterOption} </div>
  </div>
}
