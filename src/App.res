module App = {
  @react.component
  let make = () => {
    let url = RescriptReactRouter.useUrl()

    switch url.path {
    | list{} | list{"home"} => <Home />
    | list{"user"} => <Switchback />
    | list{"about"} => <Switchback />
    | _ => <PageNotFound />
    }
  }
}
