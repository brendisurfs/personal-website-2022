open Belt
open React
open Queries

@react.component
let make = (
  ~details: ProjectDetailQuery.ProjectDetailQuery_inner.t_componentProjectDetail_description,
) => {
  let isReverse = Option.getExn(details.reverse)->Js.Json.decodeBoolean->Option.getExn
  let imageObj = details.switchbackImage
  let unwrappedImage = switch imageObj {
  | Some(img) => {
      let imageData = img.responsiveImage
      switch imageData {
      | Some(data) => <DatoImage data={data} style={"aspectRatio": "1/1"} />
      | None => <div />
      }
    }
  | None => <div />
  }

  let text = details.text->Option.getExn

  switch isReverse {
  | true => <div> <div> {text->string} </div> unwrappedImage </div>
  | false => <div> <div> {text->string} </div> unwrappedImage </div>
  }
}
