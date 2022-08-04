open Queries.ProjectsQuery.ProjectsQuery_inner
open FilterOption
open ProjectCardStyles

@react.component
let make = (~project as p: t_workProjects_projects) => {
  <div className=Card.cardContainer>
    <h2> {p.title->filterOption} </h2>
    <div className=Card.description> {p.description->filterOption} </div>
  </div>
}
