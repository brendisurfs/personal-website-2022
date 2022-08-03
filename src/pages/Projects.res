open Layout
open Queries

@react.component
let make = () => {
  open React
  let projectsPageResults = switch ProjectsQuery.use() {
  | {loading: true} => "loading..."->string
  | {error: Some(_error)} => "Error loading projects :/"->string
  | {data: Some({workProjects})} => <div> <ProjectGrid workProjects /> </div>
  | {data: None, error: None, loading: false} => "No data? no projects? This seems weird"->string
  }
  // -- view
  <Layout> <div> {projectsPageResults} </div> </Layout>
}
