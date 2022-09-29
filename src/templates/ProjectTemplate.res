open Belt
open Layout
open Queries

module DetailStyles = {
  open Emotion
  let container = css({
    "display": "flex",
    "padding": "2rem",
    "flex-direction": "column",
    "color": "white",
  })
}

module ProjectDetailLayout = {
  @react.component
  let make = (~data: ProjectDetailQuery.ProjectDetailQuery_inner.t) => {
    let innerData = data.componentProjectDetail->Option.getExn

    let title = innerData.title->Option.getWithDefault("")
    let {projectLinks, description} = innerData

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
  | {error: Some(_error)} => <div> {"heck error"->React.string} </div>
  | {data: Some(data)} => <ProjectDetailLayout data />
  | {error: None} => <div> {"nothing here..."->React.string} </div>
  }
  <Layout> <div> innerDetail </div> </Layout>
}
