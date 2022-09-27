open Queries
open FilterOption
open ProjectGridStyles

type projectType = ProjectsQuery.ProjectsQuery_inner.t_workProjects_projects
type workProjects = ProjectsQuery.ProjectsQuery_inner.t_workProjects

module TypeGrid = {
  @react.component
  let make = (~projectType, ~projects: array<projectType>) => {
    open ProjectCardStyles
    <div className={typeContainer}>
      <div className={Card.sectionTitle}> {projectType->filterOption} </div>
      <div className={Card.cardGrid}>
        {projects
        ->Belt.Array.map(p => <ProjectCard project=p key={p.title->Belt.Option.getExn} />)
        ->React.array}
      </div>
    </div>
  }
}

module TypeItem = {
  @react.component
  let make = (~typeList: array<string>) => {
    <div className={ProjectGridStyles.typeNavRow}>
      {Belt.Array.map(typeList, t =>
        <div className={ProjectGridStyles.typeItem}> {t->React.string} </div>
      )->React.array}
    </div>
  }
}

// main component
@react.component
let make = (~workProjects: array<workProjects>) => {
  let projectTypeList = workProjects->Belt.Array.map(p => p.projectType->Belt.Option.getExn)
  // -- view
  <div className={typeContainer}>
    <TypeItem typeList={projectTypeList} />
    {workProjects
    ->Belt.Array.map(proj =>
      <TypeGrid
        projectType=proj.projectType
        projects=proj.projects
        key={proj.projectType->Belt.Option.getExn}
      />
    )
    ->React.array}
  </div>
}
