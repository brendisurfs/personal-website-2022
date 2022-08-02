open Queries
open FilterOption
open ProjectGridStyles

type projectType = HomeQuery.HomeQuery_inner.t_workProjects_projects
type workProjects = HomeQuery.HomeQuery_inner.t_workProjects

module ProjectCard = {
  @react.component
  let make = (~project: projectType) => {
    <CardContainer>
      <h2> {project.title->filterProjectOption} </h2>
      <Description> {project.description->filterProjectOption} </Description>
    </CardContainer>
  }
}

module TypeGrid = {
  @react.component
  let make = (~projectType, ~projects: array<projectType>) => {
    Js.log(projects)
    <TypeContainer>
      <TitleType> {projectType->filterProjectOption} </TitleType>
      <CardGrid> {projects->Belt.Array.map(p => <ProjectCard project=p />)->React.array} </CardGrid>
    </TypeContainer>
  }
}

@react.component
let make = (~workProjects: array<workProjects>) => {
  // -- view
  <TypeContainer>
    {workProjects
    ->Belt.Array.map(proj => <TypeGrid projectType=proj.projectType projects=proj.projects />)
    ->React.array}
  </TypeContainer>
}
