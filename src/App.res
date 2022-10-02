open Context
module App = {
  @react.component
  let make = () => {
    let url = RescriptReactRouter.useUrl()

    let page = switch url.path {
    | list{} | list{"home"} => <Home />
    | list{"projects"} => <Projects />
    | list{"writing"} => <Blog />
    | list{"about"} => <About />
    | list{"writing", slug} => <BlogTemplate slug />
    | list{"projects", projectSlug} => <ProjectTemplate slug={projectSlug} />
    | _ => <PageNotFound />
    }

    <TransitionContext.Provider value=TransitionContext.Loaded> page </TransitionContext.Provider>
  }
}
