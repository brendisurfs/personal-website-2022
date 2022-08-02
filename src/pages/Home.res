open Layout

module HomeQuery = %graphql(`
  query HomeQuery {
    projects: allComponentProjects {
      id
      title
    }
  }
`)

module Grid = {
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
      ->Belt.Array.map(project => <div> {project.title->filterProjectOption} </div>)
      ->React.array}
    </div>
  }
}

@react.component
let make = () => {
  open React
  let homepageRes = switch HomeQuery.use() {
  | {loading: true} => "loading..."->string
  | {error: Some(_error)} => "Error loading projects :/"->string
  | {data: Some({projects})} => <div> <Grid projects /> </div>
  | {data: None, error: None, loading: false} => "No data? no projects? This seems weird"->string
  }
  // -- view
  <Layout> <pre> {homepageRes} </pre> </Layout>
}
