module TransitionContext = {
  type transitionType = Loaded | Unloaded
  type transitionStateType = {status: transitionType}

  let transitionContext = React.createContext(Loaded)

  module Provider = {
    let provider = React.Context.provider(transitionContext)

    @react.component
    let make = (~value, ~children) => {
      React.createElement(provider, {"value": value, "children": children})
    }
  }
}
