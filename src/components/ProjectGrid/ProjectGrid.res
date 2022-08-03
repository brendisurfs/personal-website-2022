open Queries
open FilterOption
open ProjectGridStyles

type projectType = ProjectsQuery.ProjectsQuery_inner.t_workProjects_projects
type workProjects = ProjectsQuery.ProjectsQuery_inner.t_workProjects

module TypeGrid = {
  @react.component
  let make = (~projectType, ~projects: array<projectType>) => {
    open ProjectCardStyles
    <TypeContainer>
      <TitleType> {projectType->filterOption} </TitleType>
      <div className={cgGrid}>
        {projects->Belt.Array.map(p => <ProjectCard project=p />)->React.array}
      </div>
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
