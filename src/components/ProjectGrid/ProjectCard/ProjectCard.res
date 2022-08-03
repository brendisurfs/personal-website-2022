open Queries
open FilterOption
open ProjectCardStyles

type projectType = ProjectsQuery.ProjectsQuery_inner.t_workProjects_projects

@react.component
let make = (~project: projectType) => {
  <CardContainer>
    <h2> {project.title->filterOption} </h2>
    <Description> {project.description->filterOption} </Description>
  </CardContainer>
}
