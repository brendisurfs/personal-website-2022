module App = {
  @react.component
  let make = () => {
    let url = RescriptReactRouter.useUrl()

    switch url.path {
    | list{} | list{"home"} => <Home />
    | list{"projects"} => <Projects />
    | list{"projects", projectSlug} => <ProjectTemplate slug={projectSlug} />
    | list{"writing"} => <Blog />
    | list{"writing", slug} => <BlogTemplate slug />
    | list{"about"} => <About />
    | _ => <PageNotFound />
    }
  }
}
