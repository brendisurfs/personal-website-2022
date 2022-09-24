module App = {
  @react.component
  let make = () => {
    let url = RescriptReactRouter.useUrl()
    Js.log(url.path)

    switch url.path {
    | list{} | list{"home"} => <Home />
    | list{"projects"} => <Projects />
    | list{"writing"} => <Blog />
    | list{"writing", slug} => <BlogTemplate slug />
    | list{"about"} => <About />
    | _ => <PageNotFound />
    }
  }
}
