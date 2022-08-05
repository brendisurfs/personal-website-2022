open Belt
open FilterOption
open ProjectCardStyles
open Queries.ProjectsQuery.ProjectsQuery_inner

let innerStyle = ReactDOM.Style.make(~filter="grayscale(100%)", ())

// image for card
module CardImage = {
  @react.component
  let make = (~image: option<t_workProjects_projects_projectImage>, ~isHover: bool) => {
    switch image {
    // if image, wrap the children so the image overlays.
    | Some(img) =>
      let imageData = img.responsiveImage->Option.getExn
      // FIXME: why doesnt this show child props in the DOM?
      <DatoImage
        data=imageData
        style={"aspectRatio": "1/1"}
        pictureStyle={
          "filter": switch isHover {
          | true => "grayscale(0%)"
          | false => "grayscale(100%)"
          },
          "transition": "all 0.5s ease-in-out",
        }
      />
    // if no image, just pass the children
    | _ => "no image"->React.string
    }
  }
}

@react.component
let make = (~project as p: t_workProjects_projects) => {
  // create state for image hover
  let (isHover, setIsHover) = React.useState(() => false)

  let titleText = p.title->filterOption
  let descriptionText = p.description->filterOption

  // card container should be relative
  <div className=Card.cardContainer>
    <div
      onMouseEnter={_e => setIsHover(_ => true)}
      onMouseLeave={_e => setIsHover(_ => false)}
      className=Card.textContainer>
      <h2 className=Card.title> {titleText} </h2>
      <div className=Card.description> {descriptionText} </div>
    </div>
    <CardImage image=p.projectImage isHover />
  </div>
}
