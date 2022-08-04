open Belt
open FilterOption
open ProjectCardStyles
open Queries.ProjectsQuery.ProjectsQuery_inner

// image for card
module CardImage = {
  @react.component
  let make = (~image: option<t_workProjects_projects_projectImage>) => {
    switch image {
    | Some(img) =>
      // DATO IMAGE HERE
      let imageData = img.responsiveImage->Option.getExn
      Js.log(imageData.bgColor)
      <DatoImage data=imageData />
    // <img src=imageData.src alt="yula image" />
    | _ => <div> {"image is not here"->React.string} </div>
    }
  }
}

@react.component
let make = (~project as p: t_workProjects_projects) => {
  let titleText = p.title->filterOption
  let descriptionText = p.description->filterOption

  // card container should be relative
  <div className=Card.cardContainer>
    <h2> {titleText} </h2>
    <div className=Card.description> {descriptionText} </div>
    <CardImage image=p.projectImage />
  </div>
}
