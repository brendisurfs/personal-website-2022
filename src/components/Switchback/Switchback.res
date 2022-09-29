open Belt
open React
open Queries
open WebApi

@react.component
let make = (
  ~details: ProjectDetailQuery.ProjectDetailQuery_inner.t_componentProjectDetail_description,
) => {
  let isReverse = Option.getExn(details.reverse)->Js.Json.decodeBoolean->Option.getExn
  let imageObj = details.switchbackImage
  let text = details.text->Option.getWithDefault("")

  let unwrappedImage = switch imageObj {
  | Some(img) => {
      let imageData = img.responsiveImage
      switch imageData {
      | Some(data) =>
        <DatoImage
          data={data} style={"aspectRatio": "1/1", "maxWidth": "500px", "maxHeight": "500px"}
        />
      | None => <div />
      }
    }
  | None => <div />
  }

  module SBStyles = {
    open Emotion
    let container = `
    display: flex;
    align-items: top;
    flex-direction: column;
    ${Breakpoints.md(`
      flex-direction: row;
    `)}
    justify-content: space-between;
    padding-top: 2rem;
    gap: 2rem;
  `->rawCss

    let textContainer = `
    width: 100%;
    align-text: ${isReverse ? "left" : "right"}
  `->rawCss
  }

  switch isReverse {
  | true =>
    <div className={SBStyles.container}>
      unwrappedImage <div className={SBStyles.textContainer}> {text->string} </div>
    </div>
  | false =>
    <div className={SBStyles.container}>
      <div className={SBStyles.textContainer}> {text->string} </div> unwrappedImage
    </div>
  }
}
