open Layout
open Queries
open Emotion

@module("../utils/DatoDast.js") external renderDast: 'a => string = "renderDast"

module BlogStyle = {
  let container = `
  display: flex;
  padding-top: 2rem;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  width: 100%;
  `->rawCss

  let wrapper = `
    display: flex;
    max-width: 50%;
    justify-content: center;
    flex-direction: column;
    align-items: center;
  ${Breakpoints.xxl(`
    max-width: 25%;
  `)}
  `->rawCss

  let topContainer = `
  display: flex;
  flex-direction: column;
  max-width: 50%;
  `->rawCss

  let title = `
    font-size: 2rem;
    font-weight: light;
    font-family: sans-serif;
    text-transform: uppercase;
    margin: 2rem 0;
    letter-spacing: 4px;
    color: white;
  `->rawCss

  let backButton = `
    color: white;
    cursor: pointer;
    padding-bottom: 2rem;
  `->rawCss

  let tagStyles = `
    color: orange;
    display: flex;
    width: 100%;
  `->rawCss

  let textBlock = `
  font-family: sans-serif;
  font-size: 18px;
  font-weight: 300;
  line-height: 32px;

  display: flex;
  flex-direction: column;
  color: white;
  `->rawCss
}

// takes in the data, use the router.
module BlogLayout = {
  open Belt

  type slug = BlogDetailQuery.t_variables
  type blogDetailPayload = Queries.BlogDetailQuery.t

  @react.component
  let make = (~data: BlogDetailQuery.BlogDetailQuery_inner.t) => {
    switch data.componentBlog {
    | Some(v) => {
        let blogTitle = Option.getWithDefault(v.title, "")->React.string
        // blog tags
        let tags = v.tags->Belt.Array.map(tag => {
          let tagTitle = Option.getWithDefault(tag.tagTitle, "")
          let fmtTag = ` #${tagTitle} `
          fmtTag->React.string
        })

        let inner = v.body->Option.getExn
        let unwrappedData = renderDast(inner)
        Js.log(unwrappedData)

        // router to return to the writing listings page
        let goBackToWriting = () => {
          RescriptReactRouter.push("/writing")
        }

        // render
        <>
          <div className={BlogStyle.topContainer}>
            <div className={BlogStyle.backButton} onClick={_e => goBackToWriting()}>
              {"<- go back"->React.string}
            </div>
            <h2 className={BlogStyle.title}> blogTitle </h2>
          </div>
          <div className={BlogStyle.wrapper}>
            <div className={BlogStyle.tagStyles}> {"tags:"->React.string} {tags->React.array} </div>
            <div
              className={BlogStyle.textBlock} dangerouslySetInnerHTML={"__html": unwrappedData}
            />
          </div>
        </>
      }
    | None => <div />
    }
  }
}

@react.component
let make = (~slug) => {
  let blogDetailElement = switch BlogDetailQuery.use({blogSlug: slug}) {
  | {loading: true} => <div> {"one sec..."->React.string} </div>
  | {error: Some(_error)} => <div> {"error while loading!"->React.string} </div>
  | {data: Some(data)} => <BlogLayout data />
  | _ => <div> {"weird, nothing found..."->React.string} </div>
  }

  <Layout> <div className={BlogStyle.container}> blogDetailElement </div> </Layout>
}
