open Belt
open Layout
open Queries

module DetailStyles = {
  open Emotion
  let container = css({
    "display": "flex",
    "margin": "4rem",
    "justify-content": "center",
    "flex-direction": "column",
    "color": "white",
  })
}

module ProjectDetailLayout = {
  @react.component
  let make = (~data: ProjectDetailQuery.ProjectDetailQuery_inner.t_componentProjectDetail) => {
    let title = data.title->Option.getWithDefault("")
    let {projectLinks, description} = data
    let sbMap =
      description
      ->Array.map(sb => {
        <Switchback key={sb.id->Js.String.make} details=sb />
      })
      ->React.array

    open DetailStyles
    <div className={container}> <h2> {title->React.string} </h2> sbMap </div>
  }
}

@react.component
let make = (~slug) => {
  let innerDetail = switch ProjectDetailQuery.use({slug: slug}) {
  | {loading: true} => <div> {"loading"->React.string} </div>
  | {error: Some(_error)} => <div />
  | {data: Some(data)} =>
    switch data.componentProjectDetail {
    | Some(detail) => <ProjectDetailLayout data=detail />
    | None => {
        RescriptReactRouter.push("/not-found")
        <div />
      }
    }
  | {error: None} => <div> {"nothing here..."->React.string} </div>
  }
  <Layout> <div> innerDetail </div> </Layout>
}
