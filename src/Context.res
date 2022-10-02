module TransitionContext = {
  type transition = Loaded | Unloaded
  let transitionContext = React.createContext(Unloaded)

  module Provider = {
    let provider = React.Context.provider(transitionContext)

    @react.component
    let make = (~value, ~children) => {
      React.createElement(provider, {"value": value, "children": children})
    }
  }
}
