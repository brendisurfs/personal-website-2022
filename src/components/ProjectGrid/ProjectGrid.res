open Queries

type projectType = HomeQuery.t_projects

let filterProjectOption = project => {
  switch project {
  | Some(p) => p->React.string
  | None => ""->React.string
  }
}

module CardContainer = %styled.div(`
  flex-direction: column;
  border: 1px solid red;
  min-height: 100%;
  max-width: 100%;
  padding: 2rem;
  display: flex;
`)

module Description = %styled.div(`
  display: flex;
  flex-wrap: wrap;
`)

module ProjectCard = {
  @react.component
  let make = (~project: projectType) => {
    <CardContainer>
      <h2> {project.title->filterProjectOption} </h2>
      <Description> {project.description->filterProjectOption} </Description>
    </CardContainer>
  }
}

module CardGrid = %styled.div(`
  display: grid;
  grid-template-columns: repeat(4, 1fr);
`)

@react.component
let make = (~projects: array<projectType>) => {
  // -- view
  <CardGrid> {projects->Belt.Array.map(project => <ProjectCard project />)->React.array} </CardGrid>
}
