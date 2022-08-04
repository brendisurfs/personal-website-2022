open Belt
open FilterOption
open ProjectCardStyles
open Queries.ProjectsQuery.ProjectsQuery_inner

// image for card
module CardImage = {
  @react.component
  let make = (~image: option<t_workProjects_projects_projectImage>) => {
    switch image {
    // if image, wrap the children so the image overlays.
    | Some(img) =>
      let imageData = img.responsiveImage->Option.getExn
      // FIXME: why doesnt this show child props in the DOM?
      <DatoImage data=imageData style={"aspectRatio": "1/1"} />
    // if no image, just pass the children
    | _ => "no image"->React.string
    }
  }
}

@react.component
let make = (~project as p: t_workProjects_projects) => {
  let titleText = p.title->filterOption
  let descriptionText = p.description->filterOption

  // card container should be relative
  <div className=Card.cardContainer>
    <div className=Card.textContainer>
      <h2 className=Card.title> {titleText} </h2>
      <div className=Card.description> {descriptionText} </div>
    </div>
    <CardImage image=p.projectImage />
  </div>
}
