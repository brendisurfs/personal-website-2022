module App = {
  @react.component
  let make = () => {
    let url = RescriptReactRouter.useUrl()

    switch url.path {
    | list{"user"} => <Switchback />
    | list{"about"} => <Switchback />
    | list{} | list{"home"} => <Home />
    | _ => <PageNotFound />
    }
  }
}
