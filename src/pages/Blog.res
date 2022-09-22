@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()

  switch url.path {
  | list{"writing"} => <Writing />
  | list{"writing", slug} => <BlogTemplate slug />
  | _ => <div />
  }
}
