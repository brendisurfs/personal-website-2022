open Belt
open FilterOption
open ProjectCardStyles
open Queries.ProjectsQuery.ProjectsQuery_inner

// image for card
module CardImage = {
  @react.component
  let make = (~image: option<t_workProjects_projects_projectImage>, ~children: React.element) => {
    switch image {
    // if image, wrap the children so the image overlays.
    | Some(img) =>
      let imageData = img.responsiveImage->Option.getExn
      <DatoImage data=imageData> {children} </DatoImage>
    // if no image, just pass the children
    | _ => children
    }
  }
}

@react.component
let make = (~project as p: t_workProjects_projects) => {
  let titleText = p.title->filterOption
  let descriptionText = p.description->filterOption

  // card container should be relative
  <div className=Card.cardContainer>
    <CardImage image=p.projectImage>
      <h2> {titleText} </h2> <div className=Card.description> {descriptionText} </div>
    </CardImage>
  </div>
}
