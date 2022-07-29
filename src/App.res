module App = {
  @react.component
  let make = () => {
    let url = RescriptReactRouter.useUrl()

    switch url.path {
    | list{} | list{"home"} => <Home />
    | list{"writing"} => <Writing />
    | list{"about"} => <About />
    | _ => <PageNotFound />
    }
  }
}
